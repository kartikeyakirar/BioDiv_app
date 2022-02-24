app <- ShinyDriver$new("../../")
app$snapshotInit("BioDiversity")

app$snapshot()

app$setInputs(`shipSelection-sel_species` = "Alces alces|Elk")
app$snapshot()
