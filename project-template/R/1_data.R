# 1_data.R — acquire, filter, and compile the source data.
#
# Run order: 0_setup.R is sourced first (it loads the packages and reads config.yaml), then
# this script, then the analysis scripts. Everything a document reads comes from here, so
# the compiled object is the contract between the data and the documents.
#
# Run it with:
#   Rscript R/1_data.R
# or source it from an interactive session with the working directory at the project root.

source(here::here("R", "0_setup.R"))

# --- Read the source data -----------------------------------------------------------------
# Read from data/source/ and never modify anything in it. Where the data come from a
# database or a server, cache a local snapshot in data/output/ so the documents render
# offline and reproducibly.
#
# For IMR Biotic data, use the biotic-* skills from https://github.com/DeepWaterIMR/BAIT
# rather than writing a connection here.

# raw <- readr::read_csv(file.path(source_dir, "…"), show_col_types = FALSE)

# --- Filter -------------------------------------------------------------------------------
# Every exclusion is a scientific decision. State the rule, apply it once, and record how
# many records it removed so the document can report the filtering rather than assert it.

# n_raw <- nrow(raw)
# dat <- raw |>
#   dplyr::filter(...)
# n_dropped <- n_raw - nrow(dat)

# --- Derive -------------------------------------------------------------------------------
# Derived quantities belong here, not in the document, so that every document sees the same
# values and the derivation is reviewable in one place.

# --- Write --------------------------------------------------------------------------------
# One compiled object per document input. Keep the filtering counts alongside it so the
# document can quote them with inline R instead of hard-coding a number.

# saveRDS(
#   list(data = dat, n_raw = n_raw, n_dropped = n_dropped, compiled = Sys.Date()),
#   file.path(output_dir, "compiled_data.rds")
# )

message("1_data.R: nothing to do yet — fill in the source, filtering, and output steps.")
