library(shroomDK)
library(dplyr)
library(plotly)
library(readr)

# Always gitignore your API Key

thales_settled_df = read_csv('thales_settled_prices.csv')
eth_prices_df = read_csv('eth_dex_prices.csv')

# Create a eth_prices_df chart
candlestick_chart <- plot_ly(data = eth_prices_df, type = "ohlc",
                             x = ~HOUR_,
                             open = ~OPEN,
                             high = ~HIGH,
                             low = ~LOW,
                             close = ~CLOSE
) %>%
  layout(
    title = "Ethereum Prices",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Price")
  )
# Save chart as an HTML file
htmlwidgets::saveWidget(candlestick_chart, file = "candlestick_chart.html")

# Create a thales_settled_df chart
candlestick_chart2 <- plot_ly(data = thales_settled_df, type = "candlestick",
                             x = ~SETTLED_TIMESTAMP,
                             open = ~SETTLED_PRICE
) %>%
  layout(
    title = "thales_settled_df",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Price")
  )

# Save chart as an HTML file
htmlwidgets::saveWidget(candlestick_chart2, file = "candlestick_chart2.html")
