# Dota Data Doter with dotar

Dota 2 also has a widespread and active competitive scene, with teams from across the world playing professionally in various leagues and tournaments.  
Premium Dota 2 tournaments often have prize pools totaling millions of dollars, the highest of any eSport.

## Competetive edge

Dota 2 is a strategic game dependent on optimising decision making as well as refined mechanics. To aid both amateurs and professionals alike, I have developed a package of functions to assist in making informed decisions. 

## Dota 2 is complicated

Dota 2 has some complex mechanics, the underlying mathematics is straightforward but difficult to calculate on the-fly and using mental arithmetic. Thus this package allows quick minimisation and then basic decision making to made quickly while in-game.

## Effective hp app

I developed a Shiny app that I recently archived as it was incomplete. However, if people are interested I can share this code and make it available on-line again.

## Helping new players

This complexity can put off new players, thus this package aids user uptake by allowing players to quickly work out how much their Finger of Death will do at level 1 (`mag_dam(600)` = 390 hp).

## Data Set Information
Dota 2 is a popular computer game with two teams of 5 players. At the start of the game each player chooses a unique hero with different strengths and weaknesses. The dataset is reasonably sparse as only 10 of 113 possible heroes are chosen in a given game. All games were played in a space of 2 hours on the 13th of August, 2016. This was during patch 6.88 c.

## Attribute Information
The features for this dataset are three game information fields and the 10 hero choices for each team of a possible 113. The first column is the game result, -1 for dire victory and 1 for radiant victory (the names of the two teams).
