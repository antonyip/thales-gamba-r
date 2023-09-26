# thales-gamba-r
Studying Thales Parimutuel Market Settlements with an ETH VWAP.

We recommend R 4.2.3 available here: https://cran.r-project.org/ and RStudio as an IDE here: https://posit.co/download/rstudio-desktop/ 

# Reproduce 

1. Clone this repo. I use GitHub Desktop, you can grab the URL to clone in that app.
2. Open RStudio and then navigate to the `thales-gamba-r.Rproj` file and open it. This will 
abstract away any non-relative file paths.
3. In RStudio run the command `install.packages('renv'); renv::restore()`.
The environment lock file includes installs for dplyr and plotly.
4. You can now run the analysis script `compare_thales_settlement`.


# Flipside Data

The Thales settled prices query is available here: 
https://flipsidecrypto.xyz/edit/queries/544503b2-6577-49e8-bcf0-d25ebefc5d51

The ETH Volume Weighted Average Price query is available here:
https://flipsidecrypto.xyz/charliemarketplace/q/4UyLmInQZv-4/eth-vwap-forecasts