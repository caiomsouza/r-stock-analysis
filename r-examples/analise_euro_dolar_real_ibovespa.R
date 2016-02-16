
setwd("~/git/Bitbucket/ucm/PRIMER_CUATRIMESTRE/GESTION_GLOBAL_DEL_RIESGO_SCORING/tareas")

library(tseries) # adf.test, kpss.test, bds.test, get.hist.quote, portfolio.optim, surrogate, arma, garch
#install.packages("forecast")
library(forecast)
# En el paquete forecast tiene un modelo auto ARIMA.
#install.packages("fArma")
library(fArma) #ARMAFIT, RSFIT
#install.packages("fGarch")
library(fGarch) #GARCHFIT formula ~arma (2,1) + garch (1,1) # ~ AltGr + 4
#install.packages("outliers")
library(outliers) #: outlier, rm.outlier, scores, chisq.out.test # para detectar outliers o datos an?malos ojo serie estacionaria
#install.packages("zoo")
library(zoo)
#setinternet2() #esto abre el puerto de internet



con <- url("http://www.oanda.com")
if(!inherits(try(open(con), silent = TRUE), "try-error")) {
  close(con)
  x <- get.hist.quote(instrument = "EUR/USD", provider = "oanda",
                      start = Sys.Date() - 1000)
  plot(x, main = "EUR/USD")
}

# http://www.inside-r.org/packages/cran/tseries/docs/get.hist.quote

moneda1 <- "EUR/BRL"

con <- url("http://www.oanda.com")
if(!inherits(try(open(con), silent = TRUE), "try-error")) {
  close(con)
  x <- get.hist.quote(instrument = moneda1, provider = "oanda",
                      start = Sys.Date() - 1000)
  plot(x, main = moneda1)
}

moneda2 <- "USD/BRL"

con <- url("http://www.oanda.com")
if(!inherits(try(open(con), silent = TRUE), "try-error")) {
  close(con)
  x <- get.hist.quote(instrument = moneda2, provider = "oanda",
                      start = Sys.Date() - 1000)
  plot(x, main = moneda2)
}


stock.name <- "^BVSP"
stock.description <- "IBOVESPA"

## lectura de los datos hist?ricos del ^BVSP
stock.name <- get.hist.quote(instrument=stock.name, quote="AdjClose")

# BVSP time series starts 1993-04-27
# http://finance.yahoo.com/q?s=%5EBVSP

series.name <- stock.name

str(series.name)
summary(series.name)
start(series.name)
end(series.name)
plot(series.name)

series.name.short <-window(series.name,start=as.Date("1980-01-01"),end=as.Date("2016-02-15"))
plot(series.name.short, main="IBOVESPA")

