% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dota_ehp.R
\name{ehp_per_gold}
\alias{ehp_per_gold}
\title{Effective health points per unit gold cost of a known item purchase.}
\usage{
ehp_per_gold(hp, armour, item_hp = 0, item_armour = 0, gold)
}
\arguments{
\item{hp}{input numeric vector}

\item{armour}{input numeric vector}

\item{item_hp}{input numeric vector}

\item{item_armour}{input numeric vector}

\item{gold}{input positive integer vector}
}
\value{
numeric vector of effective hp difference per gold spent
}
\description{
Calculates the difference between current ehp and future ehp
given purchase of an item that provides bonus item_hp or item_armour,
relative to gold investment.
}
\examples{
ehp_per_gold(hp = 1800, armour = 18, item_hp = c(725, 1150), item_armour = c(3.57, 0), gold = c(5675, 5500))
}

