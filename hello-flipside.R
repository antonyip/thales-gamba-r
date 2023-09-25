library(shroomDK)
library(dplyr)
library(plotly)

# Always gitignore your API Key

thales_settled_df = pd.read_csv('thales_settled_prices.csv')
eth_prices_df = pd.read_csv('eth_dex_prices.csv')
# Create a candlestick chart
candlestick_chart <- plot_ly(data = eth_prices_df, type = "candlestick",
                             x = ~hour_,
                             open = ~open,
                             high = ~high,
                             low = ~low,
                             close = ~close
) %>%
  layout(
    title = "Candlestick Chart",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Price")
  )

# Save chart as an HTML file
htmlwidgets::saveWidget(candlestick_chart, file = "candlestick_chart.html")
