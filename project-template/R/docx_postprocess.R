# docx_postprocess.R — clean up the Word files Quarto produces.
#
# Quarto wraps every cross-referenced figure and table in a one-cell table. Word accepts the
# nesting, but the figure then shows a dashed table outline and a table move handle, and
# LibreOffice may linearise the inner cells. `unwrap_float_tables()` moves the wrapper's
# contents into the document body and removes the wrapper, keeping the caption and its
# cross-reference bookmark.
#
# The functions here edit word/document.xml directly: a .docx is a zip archive, so the file
# is unzipped, the XML is edited with xml2, and the archive is rebuilt.
#
# Requires: xml2, zip. Both are optional packages — call ensure_packages("xml2", "zip")
# before sourcing this file, or let the functions install them on first use.

.docx_ns <- function(doc) xml2::xml_ns(doc)

#' Open a .docx for editing
#'
#' @param path Path to the .docx file.
#' @return A list with the extraction directory, the parsed document XML, its namespaces,
#'   and the path to word/document.xml.
#' @keywords internal
.docx_open <- function(path) {
  if (!file.exists(path)) stop("No such file: ", path, call. = FALSE)
  dir <- file.path(tempdir(), paste0("docx-", basename(tools::file_path_sans_ext(path))))
  unlink(dir, recursive = TRUE, force = TRUE)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  zip::unzip(path, exdir = dir)

  xml_path <- file.path(dir, "word", "document.xml")
  if (!file.exists(xml_path)) {
    stop("Not a Word document, or the archive is damaged: ", path, call. = FALSE)
  }
  doc <- xml2::read_xml(xml_path)
  list(dir = dir, doc = doc, ns = .docx_ns(doc), xml_path = xml_path)
}

#' Write an edited .docx back out
#'
#' Rezips in "mirror" mode so the archive keeps the layout Word expects, then replaces the
#' original only once the new file has been written and re-read successfully.
#'
#' @param handle The list returned by `.docx_open()`.
#' @param path Destination path.
#' @keywords internal
.docx_write <- function(handle, path) {
  xml2::write_xml(handle$doc, handle$xml_path)

  tmp <- paste0(path, ".tmp")
  files <- list.files(handle$dir, all.files = TRUE, recursive = TRUE, no.. = TRUE)
  withr_wd <- setwd(handle$dir)
  on.exit(setwd(withr_wd), add = TRUE)
  zip::zipr(zipfile = normalizePath(tmp, mustWork = FALSE), files = files, mode = "mirror")
  setwd(withr_wd)

  # A .docx that will not open gives no useful error, so confirm the archive re-reads
  # before the original is replaced.
  check <- tryCatch(
    {
      d <- file.path(tempdir(), "docx-verify")
      unlink(d, recursive = TRUE, force = TRUE)
      zip::unzip(tmp, files = "word/document.xml", exdir = d)
      xml2::read_xml(file.path(d, "word", "document.xml"))
      TRUE
    },
    error = function(e) FALSE
  )
  if (!isTRUE(check)) {
    unlink(tmp)
    stop("Post-processing produced an unreadable .docx; the original is unchanged.",
         call. = FALSE)
  }

  # file.rename() fails across filesystems, which happens whenever tempdir() is on a
  # different volume than the project.
  if (!file.rename(tmp, path)) {
    file.copy(tmp, path, overwrite = TRUE)
    unlink(tmp)
  }
  invisible(path)
}

#' Move the contents of a one-cell wrapper table into the document body
#'
#' @param wrapper A `w:tbl` node.
#' @param ns Document namespaces.
#' @keywords internal
.unwrap <- function(wrapper, ns) {
  cell <- xml2::xml_find_first(wrapper, "./w:tr[1]/w:tc[1]", ns = ns)
  if (inherits(cell, "xml_missing")) return(invisible(FALSE))
  children <- xml2::xml_children(cell)
  # tcPr is the cell's own formatting and has no meaning outside a table.
  children <- children[xml2::xml_name(children) != "tcPr"]
  for (child in children) {
    xml2::xml_add_sibling(wrapper, child, .where = "before", .copy = TRUE)
  }
  xml2::xml_remove(wrapper)
  invisible(TRUE)
}

#' Remove Quarto's float wrappers from a Word document
#'
#' Unwraps the one-cell tables Quarto puts around cross-referenced tables and figures, so
#' that both sit inline in the document body as Word's own constructs. The image stays an
#' ordinary inline drawing, which is what Word produces for an inserted figure, and the
#' caption paragraph and its bookmark are preserved.
#'
#' @param input Path to the rendered .docx.
#' @param output Path to write to. Defaults to `input`, editing in place.
#' @param figures Unwrap figure floats? Defaults to TRUE.
#' @param tables Unwrap table floats? Defaults to TRUE.
#' @return The output path, invisibly.
#' @examples
#' \dontrun{
#' unwrap_float_tables("docs/manuscript/manuscript.docx")
#' }
unwrap_float_tables <- function(input, output = input, figures = TRUE, tables = TRUE) {
  for (p in c("xml2", "zip")) {
    if (!requireNamespace(p, quietly = TRUE)) {
      stop("Package '", p, "' is required. Run ensure_packages(\"", p, "\").", call. = FALSE)
    }
  }

  h <- .docx_open(input)
  n_tables <- 0L
  n_figures <- 0L

  if (isTRUE(tables)) {
    # A cross-referenced table is a body-level table that contains another table.
    wrappers <- xml2::xml_find_all(h$doc, "//w:body/w:tbl[.//w:tbl]", ns = h$ns)
    for (w in wrappers) if (isTRUE(.unwrap(w, h$ns))) n_tables <- n_tables + 1L
  }

  if (isTRUE(figures)) {
    # A cross-referenced figure is a one-row, one-cell body-level table holding a drawing
    # and a paragraph whose text starts with the caption prefix.
    wrappers <- xml2::xml_find_all(
      h$doc,
      paste0(
        "//w:body/w:tbl[count(w:tr) = 1 and count(w:tr[1]/w:tc) = 1 and .//w:drawing",
        " and .//w:t[starts-with(normalize-space(.), 'Figure')]]"
      ),
      ns = h$ns
    )
    for (w in wrappers) if (isTRUE(.unwrap(w, h$ns))) n_figures <- n_figures + 1L
  }

  .docx_write(h, output)
  message(
    "Unwrapped ", n_tables, " table float", if (n_tables == 1L) "" else "s",
    " and ", n_figures, " figure float", if (n_figures == 1L) "" else "s",
    " in ", basename(output)
  )
  invisible(output)
}

#' Unwrap Word hyperlinks
#'
#' LibreOffice renders Quarto's `w:hyperlink` elements with a spurious trailing character.
#' Replacing each hyperlink with its own children keeps the visible text and drops the
#' element. The link stops being clickable, so use this only for a document that is going
#' to print or to a submission system that flattens links anyway.
#'
#' @inheritParams unwrap_float_tables
#' @return The output path, invisibly.
unwrap_hyperlinks <- function(input, output = input) {
  h <- .docx_open(input)
  links <- xml2::xml_find_all(h$doc, "//w:hyperlink", ns = h$ns)
  for (link in links) {
    for (child in xml2::xml_children(link)) {
      xml2::xml_add_sibling(link, child, .where = "before", .copy = TRUE)
    }
    xml2::xml_remove(link)
  }
  .docx_write(h, output)
  message("Unwrapped ", length(links), " hyperlinks in ", basename(output))
  invisible(output)
}

#' Stop the template's automatic numbering on named headings
#'
#' A Word reference document that numbers headings will also number "Summary" and
#' "References". Setting `numId` to 0 on those paragraphs opts them out.
#'
#' @inheritParams unwrap_float_tables
#' @param headings Character vector of heading texts to unnumber.
#' @return The output path, invisibly.
unnumber_headings <- function(input, output = input, headings = c("Summary", "References")) {
  h <- .docx_open(input)
  n <- 0L
  for (heading in headings) {
    nodes <- xml2::xml_find_all(
      h$doc,
      sprintf("//w:body/w:p[.//w:t[normalize-space(.) = '%s']]", heading),
      ns = h$ns
    )
    for (node in nodes) {
      numid <- xml2::xml_find_first(node, ".//w:numPr/w:numId", ns = h$ns)
      if (!inherits(numid, "xml_missing")) {
        xml2::xml_set_attr(numid, "w:val", "0")
        n <- n + 1L
      }
    }
  }
  .docx_write(h, output)
  message("Unnumbered ", n, " heading", if (n == 1L) "" else "s", " in ", basename(output))
  invisible(output)
}
