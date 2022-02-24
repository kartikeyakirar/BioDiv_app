context("species_selection_server")

# See ?testServer for more information
testServer(species_selection_server, {
  # Set initial value of a button
  session$setInputs(sel_species = "Alces alces|Elk")

  # Check the value of the reactiveVal `count()`
  expect_class(param(), "data.frame")
  
})
