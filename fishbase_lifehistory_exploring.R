#fishbase exploring########################################################################
#load packages
library(rfishbase)
library(dplyr)

#figure out which genus(s) you want to look at 
fish <- species_list(Genus = c("Oncorhynchus", "Salvelinus"))
length(fish) #how many species we looking at? 

#not much I am interested in here 
traits <-  species(fish)
colnames(traits) #what sort of traits are there? 

pop <- popgrowth(fish)
colnames(pop) #ooh this looks better

#select traits you care about
pop_short <- pop %>%
  select(Species, Sex, Loo, SE_Loo, SD_Loo, AssumedDistLoo, K, SE_K, SD_K, AssumedDistK,
         to, M, MethodM, Mquality, SE_M, SD_M, AssumedDistM, Lm, TypeLm, LmFemale, 
         YearStart, YearEnd, YearRemark) %>%
  arrange(Species)

head(pop_short) #oof. lots of NAs. 

#how many have SD or SE on Loo?
nrow(filter(pop_short, !is.na(SE_Loo)|!is.na(SD_Loo))) #1

#how many have SD or SE on M?
nrow(filter(pop_short, !is.na(SE_M)|!is.na(SD_M))) #0