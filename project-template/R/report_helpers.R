# report_helpers.R — display helpers used by the documents in docs/.
#
# These format numbers and lists for prose. They exist so that every number in the text is
# produced by code rather than typed, and so that formatting is identical wherever a value
# appears. Source this after R/0_setup.R.

#' Format a number for prose
#'
#' Thousands are separated by a thin space, which is the SI convention and reads better in a
#' rendered document than a comma.
#'
#' @param x Numeric vector.
#' @param digits Number of decimal places. Defaults to 0.
#' @param na Character string used in place of `NA`.
#' @return A character vector.
#' @examples
#' fmt(1234567)        # "1 234 567"
#' fmt(0.0456, 3)      # "0.046"
fmt <- function(x, digits = 0, na = "–") {
  out <- ifelse(
    is.na(x), na,
    formatC(x, format = "f", digits = digits, big.mark = " ")
  )
  trimws(out)
}

#' Round to a sensible number of decimals for the magnitude
#'
#' Large values are reported whole; small values keep enough digits to stay informative.
#' Use this when a value's magnitude is not known until the data are read.
#'
#' @param x Numeric vector.
#' @return A character vector.
round_report <- function(x) {
  digits <- ifelse(
    is.na(x), 0L,
    ifelse(abs(x) >= 100, 0L, ifelse(abs(x) >= 10, 1L, ifelse(abs(x) >= 1, 2L, 3L)))
  )
  vapply(
    seq_along(x),
    function(i) fmt(x[i], digits = digits[i]),
    character(1)
  )
}

#' Write a vector as an English list
#'
#' Uses the Oxford comma. Intended for inline R inside prose.
#'
#' @param x Vector to list.
#' @param conjunction Word joining the last two elements, "and" or "or".
#' @param quote Wrap each element in quotation marks?
#' @return A single character string.
#' @examples
#' list_values(c("cod", "haddock", "saithe"))   # "cod, haddock, and saithe"
list_values <- function(x, conjunction = "and", quote = FALSE) {
  x <- as.character(x[!is.na(x)])
  if (quote) x <- paste0("“", x, "”")
  n <- length(x)
  if (n == 0) return("")
  if (n == 1) return(x)
  if (n == 2) return(paste(x, collapse = paste0(" ", conjunction, " ")))
  paste0(paste(x[-n], collapse = ", "), ", ", conjunction, " ", x[n])
}

#' Spell a small integer out as a word
#'
#' Scientific style writes integers below 11 as words, except beside a unit, and never
#' begins a sentence with a numeral. Use `spell_number()` in prose and `fmt()` in tables.
#'
#' @param x Numeric vector.
#' @param sentence_start Capitalise the first letter? Set TRUE when the value opens a
#'   sentence, which also forces a word rather than a numeral at any magnitude.
#' @param cap_below Values below this are written as words. Defaults to 11.
#' @return A character vector.
#' @examples
#' spell_number(8)                          # "eight"
#' spell_number(66, sentence_start = TRUE)  # "Sixty-six"
spell_number <- function(x, sentence_start = FALSE, cap_below = 11) {
  units_ <- c("zero", "one", "two", "three", "four", "five", "six", "seven", "eight",
              "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
              "sixteen", "seventeen", "eighteen", "nineteen")
  tens_ <- c("twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety")

  as_word <- function(n) {
    if (is.na(n) || n != round(n) || n < 0 || n > 99) return(NA_character_)
    if (n < 20) return(units_[n + 1])
    t <- tens_[n %/% 10 - 1]
    if (n %% 10 == 0) t else paste0(t, "-", units_[n %% 10 + 1])
  }

  out <- vapply(x, function(n) {
    word <- as_word(n)
    # A sentence may not open with a numeral, so a word is used at any magnitude that can
    # be spelled. Where it cannot, the sentence has to be recast — flag it rather than
    # emitting a numeral where one is not allowed.
    if (sentence_start) {
      if (is.na(word)) {
        return(paste0("[RECAST: sentence would begin with the numeral ", n, "]"))
      }
      return(paste0(toupper(substring(word, 1, 1)), substring(word, 2)))
    }
    if (!is.na(word) && n < cap_below) word else fmt(n)
  }, character(1))

  out
}

#' Render a table, or say why it is empty
#'
#' Keeps a document renderable when a data object is missing or empty, which matters for a
#' report that is compiled repeatedly while the data are still arriving.
#'
#' @param x A data frame.
#' @param caption Table caption.
#' @param status Message shown when `x` has no rows.
#' @param ... Passed to `knitr::kable()`.
#' @return A knitr kable, or a character string.
table_or_status <- function(x, caption, status = "No data available yet.", ...) {
  if (is.null(x) || !nrow(x)) {
    return(knitr::asis_output(paste0("*", status, "*\n")))
  }
  knitr::kable(x, caption = caption, ...)
}
