% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{CIndex}
\alias{CIndex}
\title{Compute concordance index.}
\usage{
CIndex(yhat, y, status, w = NULL)
}
\arguments{
\item{yhat}{the yhat}

\item{y}{the y}

\item{status}{the status}

\item{w}{the weights, can be NULL}
}
\description{
Compute concordance index.
}
\examples{
set.seed(10101)
N=3000;p=20
nzc=p/3
x=matrix(rnorm(N*p),N,p)
beta=rnorm(nzc)
fx=x[,seq(nzc)]\%*\%beta/3
hx=exp(fx)
ty=rexp(N,hx)
tcens=rbinom(n=N,prob=.3,size=1)# censoring indicator
y=cbind(time=ty,status=1-tcens) #
## Use saved prediction for example
preds=readRDS(system.file("extdata", "example_preds.RDS", package = "fcindex"))
## Unweighted observations
c1=apply(preds,2,CIndex,y=y[,1],status=y[,2])
## Using weighted observations
c2=apply(preds,2,CIndex,y=y[,1],status=y[,2], w = c(rep(2, 2000), rep(1, 1000)))
cbind(c1, c2)
}
