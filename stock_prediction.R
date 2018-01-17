install.packages(c("tseries","forecast","quantmod"))
library(tseries)
library(forecast)
library(quantmod)

sp500 <- new.env()
stocks <- getSymbols(c("FCA"), env = sp500,
  
from = as.Date("2015-01-01"), 
  to = as.Date("2015-10-31"))
FCA <- sp500$FCA
FCA <- get("FCA",envir = sp500)
FCA <- with(sp500, FCA)
FCA  <- as.data.frame(FCA)

