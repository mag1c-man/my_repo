#'---
#'title: "leanring data.table"
#'output: github_document
#'---

#+ r setup, include = FALSE
knitr::opts_chunk$set(echo = TRUE)
library("data.table")
library("here")


#+ r doing stuff

DT <- data.table(Fruit = rep(c("banana", "apple", "orange"), 3:1),
                 Year  = c(2008, 2009, 2010, 2009, 2010, 2010),
                 Count = 1:6)
DT

class(DT)

DT[1:2,2:3]

#' ##select rows

DT[Fruit == "banana",]

#' ##order

DT[order(Fruit),]

DT[order(Fruit, -Year)]

#' ##sample

DT[sample(.N, 3)]

#' ##select columns

DT[, Count]

DT[, .(Count)]
