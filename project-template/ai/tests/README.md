# Tests

Tests for the project's own R code — the helpers in `R/`, and any function whose behaviour
the documents depend on. `testthat` files, or plain scripts that stop on failure.

The documents themselves are not unit-tested; a render that completes without warnings, and
a read of the rendered output, is the test that matters for those.
