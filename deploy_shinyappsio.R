# Script to show a programmatic way of deploying to shinyapps.io
# Pre-reqs: 
# - Ensure you have environment variables for your shinyapps.io account
#   corresponding to your account's id, token, and secret stored in a
#   .Renviron file either within this directory or your home directory.
#   See Renviron.example for the syntax

# create application manifest file
library(rsconnect)
writeManifest(appDir = "tron")

# establish account credentials
rsconnect::setAccountInfo(
  name = Sys.getenv("RSCONNECT_ID"),
  token = Sys.getenv("RSCONNECT_TOKEN"),
  secret = Sys.getenv("RSCONNECT_SECRET")
)

# deploy tutorial (substitute appName as appropriate)
rsconnect::deployApp(
  appDir = "tron",
  appName = "learntron", 
  launch.browser = FALSE, 
  forceUpdate = TRUE
)
