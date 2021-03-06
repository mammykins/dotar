% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dota_ehp.R
\name{ehp_difference}
\alias{ehp_difference}
\title{Effective health point difference of a hero given a known item purchase.}
\usage{
ehp_difference(hp, armour, item_hp = 0, item_armour = 0)
}
\arguments{
\item{hp}{input numeric vector}

\item{armour}{input numeric vector}

\item{item_hp}{input numeric vector}

\item{item_armour}{input numeric vector}
}
\value{
numeric vector of effective hp difference
}
\description{
Calculates effective hp gain by multiplying hp.multiplier (armour considered) by current hp
for before and after an item purchase. This determines how much ehp the item gives you.
It gives the added flexibility for adjusting hp and armour seperately as some items
adjsut this.
}
\examples{
ehp_difference(625, 0, 0, 2)  #  Phoenix getting a ring of protection
ehp_difference(1800, 18, 725, 3.57)  #  Eye of skadi better than heart?
ehp_difference(1800, 18, 1150, 0)  #  Depends on the current armour value, also consider gold cost.
ehp_difference(hp = 1800, armour = 18, item_hp = c(725, 1150), item_armour c(3.57, 0))  #  Vectorised
}
\seealso{
ehp_per_gold()
}

