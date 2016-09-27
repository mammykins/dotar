#Dota 2
#Effective hp calculator
#effective hp against physical damage type only (those right clicks!)

#based on http://humbledota.com/2014/08/08/92/
#run code
#this gives access to the function ## ehp(hp=, armour=) ##
#call the function in the console and provide it with current hp and armour stats
#this gives your ehp, you can then compare



#' The damage reduction provided by total armour (between zero and one).
#'
#' Note the hard-coded 0.06 multiplier which is a constant of the Dota universe.
#' @param armour input numeric vector
#' @return numeric vector where 1 is total damage reduction and zero is none.
#' Can provide a negative which suggests negative armour value can give a negative damage reduction
#' i.e. the target takes additional damage
#' @seealso \code{\link{hp_multiplier}}
#' @export
#' @examples
#' damred(1:5)
#' damred((0 - 7 - 20 - 10))  #  Natural order, desolator, amplify damage and solar crest; ouch!
#' plot(1:40, damred(1:40))
damred <- function(armour){
  ((0.06*armour) / (1 + (0.06*armour)))
}

#' The hit points multiplier is an armour adjusted factor which affects a heroes effective hp.
#'
#' Calculates the hp multiplier, the
#' factor by which to times your current hp to get your effective hp.
#' Where effective hp means how much damage can a unit take before dying, after reductions.
#' In this case, armour increases a unit's effective hp against physical damage.
#' This is more intuitive to damage reduction as one can compare with the damage output offered by an enemy.
#' @param armour input numeric vector
#' @return numeric vector of hp multiplier to get effective hp
#' Can provide a negative which suggests negative armour value can give a negative damage reduction
#' i.e. the target takes additional damage
#' @seealso
#' @export
#' @examples
#' hp.multiplier(-30)
hp_multiplier <- function(armour){
  ((1) / (1 - damred(armour)))
}

#' Calculate the effective health points of a hero.
#'
#' Effective HP is the amount of physical damage one can take before dying, and is based on the unit's HP.
#' Calculates effective hp by multiplying hp.multiplier (armour considered) by current hp.
#' Where effective hp means how much damage can a unit take before dying, after reductions.
#' In this case, armour increases a unit's effective hp against physical damage.
#' @param hp input numeric vector
#' @param armour input numeric vector
#' @return numeric vector of effective hp
#' @seealso
#' @export
#' @examples
#' ehp(625, 0)
#' ehp(3000, c(6, 16))  #  What happens if I buy a platemail?
ehp <- function(hp, armour){
  hp * hp_multiplier(armour)
}

#' Effective health point difference of a hero given a known item purchase.
#'
#' Calculates effective hp gain by multiplying hp.multiplier (armour considered) by current hp
#' for before and after an item purchase. This determines how much ehp the item gives you.
#' It gives the added flexibility for adjusting hp and armour seperately as some items
#' adjsut this.
#' @param hp input numeric vector
#' @param armour input numeric vector
#' @param item_hp input numeric vector
#' @param item_armour input numeric vector
#' @return numeric vector of effective hp difference
#' @seealso ehp_per_gold()
#' @export
#' @examples
#' ehp_difference(625, 0, 0, 2)  #  Phoenix getting a ring of protection
#' ehp_difference(1800, 18, 725, 3.57)  #  Eye of skadi better than heart?
#' ehp_difference(1800, 18, 1150, 0)  #  Depends on the current armour value, also consider gold cost.
#' ehp_difference(hp = 1800, armour = 18, item_hp = c(725, 1150), item_armour c(3.57, 0))  #  Vectorised
ehp_difference <- function(hp, armour, item_hp = 0, item_armour = 0) {
  ehp(hp + item_hp, armour + item_armour) - ehp(hp, armour)
}

#' Effective health points per unit gold cost of a known item purchase.
#'
#' Calculates the difference between current ehp and future ehp
#' given purchase of an item that provides bonus item_hp or item_armour,
#' relative to gold investment.
#' @param hp input numeric vector
#' @param armour input numeric vector
#' @param item_hp input numeric vector
#' @param item_armour input numeric vector
#' @param gold input positive integer vector
#' @return numeric vector of effective hp difference per gold spent
#' @seealso
#' @export
#' @examples
#' ehp_per_gold(hp = 1800, armour = 18, item_hp = c(725, 1150), item_armour = c(3.57, 0), gold = c(5675, 5500))
ehp_per_gold <- function(hp, armour, item_hp = 0, item_armour = 0, gold){
  ehp_difference(hp = hp, armour = armour, item_hp = item_hp, item_armour = item_armour) / gold
} # example of lexical scoping

#' Effective health points against magic damage
#'
#' Calculate the health pool available against magic damage of a hero. Dependent on hp and
#' the magic resistance of a hero which has a base of 0.35 but can vary due to auras and items.
#' Visage and Meepo have different base magic resistance (0.10 and 0.45, consult Dota wiki).
#' @param hp input numeric vector
#' @param mag_res magic resistance as a numeric vector
#' @return numeric vector of effective hp against magic damage
#' @seealso
#' @export
#' @examples
#' mag_ehp(390)  #  Threshold for Lion's Finger of Death Level 1 and base magic resist for most heroes.
#' mag_ehp(200)  #  The minimum hp pool in Dota2, think decay stacks.
mag_ehp <- function(hp, mag_res = 0.35) {
  hp / (1 - mag_res)
}

#' Magic damage to health points of a hero
#'
#' Calculate the magic damage against a hero caused by a particular attack. Dependent on spell or attack damage and
#' the magic resistance of a hero which has a base of 0.35 but can vary due to auras and items.
#' Visage and Meepo have different base magic resistance (0.10 and 0.45, consult Dota wiki).
#' @param hp input numeric vector
#' @param mag_res magic resistance as a numeric vector
#' @return numeric vector of magic damage inflicted on target
#' @seealso
#' @export
#' @examples
#' mag_dam(600)  #  Threshold for Lion's Finger of Death Level 1 and base magic resist for most heroes.
#' sum(mag_dam(rep(40, 4)))  #  A strong level 1 nuke; Disruptor thunder strike
mag_dam <- function(magic_damage, mag_res = 0.35) {
  magic_damage*(1 - mag_res)
}

#' Physical damage to health points of a hero
#'
#' Calculate the physical damage against a hero caused by a particular attack. Dependent on spell or attack damage and
#' the physical resistance which is based on the hero's armour.
#' @param physical_damage input numeric vector
#' @param armour physical resistance as a numeric vector
#' @return numeric vector of magic damage inflicted on target
#' @seealso
#' @export
#' @examples
#' phys_dam(500, 0)  #  A level 1 Suicide Squad from Techies versus zero armour hero.
#' sum(phys_dam(rep(40, 2)))  #  Germinate attack from Weaver.
phys_dam <- function(physical_damage, armour) {
  physical_damage - physical_damage*damred(armour)
}
