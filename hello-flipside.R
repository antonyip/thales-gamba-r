library(shroomDK)
library(dplyr)
library(plotly)
library(readr)

# Always gitignore your API Key

thales_settled_df = read_csv('thales_settled_prices.csv')
eth_prices_df = read_csv('eth_dex_prices.csv')

# Create a candlestick chart
candlestick_chart <- plot_ly(data = eth_prices_df, type = "candlestick",
                             x = ~HOUR_,
                             open = ~OPEN,
                             high = ~HIGH,
                             low = ~LOW,
                             close = ~CLOSE
) %>%
  layout(
    title = "Candlestick Chart",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Price")
  )

# Save chart as an HTML file
htmlwidgets::saveWidget(candlestick_chart, file = "candlestick_chart.html")
