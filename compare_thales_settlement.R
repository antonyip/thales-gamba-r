library(dplyr)
library(plotly)

# load data 
thales_settled = read.csv('thales_settled_prices.csv')
eth_prices = read.csv('eth_dex_prices.csv') # has broken end of line, leaving for now

# reformat 
eth_prices$HOUR_ <- as.POSIXct(eth_prices$HOUR_, format = "%Y-%m-%d %H:%M:%OS", tz = "UTC")
thales_settled$SETTLED_TIMESTAMP <- as.POSIXct(thales_settled$SETTLED_TIMESTAMP, format = "%Y-%m-%d %H:%M:%OS", tz = "UTC")
thales_settled$SETTLED_PRICE <- as.numeric(thales_settled$SETTLED_PRICE)

# Create a candlestick chart with custom x-axis ticks
plot_ly(data = eth_prices, type = "candlestick",
        x = ~HOUR_,
        open = ~OPEN,
        high = ~HIGH,
        low = ~LOW,
        close = ~CLOSE) %>% 
  layout(
    title = list(text = "Ethereum Candlechart", y = 0.95),
    xaxis = list(title = "UTC Hour"),
    yaxis = list(title = "ETH-USD Price")
  )

plot_ly() %>% add_trace(
 data = eth_prices, x = ~HOUR_, y = ~CLOSE, name = 'ETH-VWAP-CLOSE',
 type = 'scatter', mode = 'lines') %>% 
  add_trace(
  data = thales_settled, x = ~SETTLED_TIMESTAMP, y = ~SETTLED_PRICE, 
  name = 'THALES Settlement') %>% 
  layout(
    title = list(text = "Thales Settlement on Price Chart", y = 0.95),
    xaxis = list(title = "UTC Hour"),
    yaxis = list(title = "ETH-USD Price")
  )
