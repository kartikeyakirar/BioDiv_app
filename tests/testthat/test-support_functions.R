context("Supporting_functions")

test_that("get_time_stamp", {
    expect_true(any(class(get_time_stamp(g_bio_diversity)) %in% c("POSIXct", "POSIXt" )))
})

test_that("get_processed_dataset", {
    dat <- get_processed_dataset(g_bio_diversity)
    expect_true(all(c("eventTime", "dateTime", "searchName" ) %in% colnames(dat)))
})

test_that("get_choice_dataset", {
    dat <- get_processed_dataset(g_bio_diversity)
    expect_true(all(colnames(get_choice_dataset(dat)) %in% c("value","label1","label2")))
})