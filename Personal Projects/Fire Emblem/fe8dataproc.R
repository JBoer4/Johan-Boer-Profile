library(tidyverse)

setwd("data")

growths <- data.frame(t(data.frame(Eirika= c(	70,	40,	60,	60,	60,	30,	30),
           Seth = c(90,	50,	45,	45,	25,	40,	30),
           Franz	= c(80,	40,	40,	50,	40,	25,	20),
           Gilliam	= c(90,	45,	35,	30,	30,	55,	20),
           Moulder	= c(70,	40,	50,	40,	20,	25,	25),
           Vanessa	= c(50,	35,	55,	60,	50,	20,	30),
           Ross	= c(70,	50,	35,	30,	40,	25,	20),
           Garcia	= c(80,	65,	40,	20,	40,	25,	15),
           Neimi = c(55,	45,	50,	60,	50,	15,	35),
           Colm	= c(75,	40,	40,	65,	45,	25,	20),
           Artur	= c(55,	50,	50,	40,	25,	15,	55),
           Lute	= c(45,	65,	30,	45,	45,	15,	40),
           Natasha	= c(50,	60,	25,	40,	60,	15,	55),
           Joshua	= c(80,	35,	55,	55,	30,	20,	20),
           Ephraim	= c(80,	55,	55,	45,	50,	35,	25),
           Forde	= c(85,	40,	50,	45,	35,	20,	25),
           Kyle	= c(90,	50,	40,	40,	20,	25,	20),
           Tana	= c(65,	45,	40,	65,	60,	20,	25),
           Amelia	= c(60,	35,	40,	40,	50,	30,	15),
           Innes	= c(75,	40,	40,	45,	45,	20,	25),
           Gerik =	c(90,	45,	40,	30,	30,	35,	25),
           Tethys	= c(85,	5,	10,	70,	80,	30,	75),
           Marisa	= c(75,	30,	55,	60,	50,	15,	25),
           LArachel =	c(45,	50,	45,	45,	65,	15,	50),
           Dozla	= c(85,	50,	35,	40,	30,	30,	25),
           Saleh	= c(50,	30,	25,	40,	40,	30,	35),
           Ewan	= c(50,	45,	40,	35,	50,	15,	40),
           Cormag	= c(85,	55,	40,	45,	35,	25,	15),
           Rennac = c(65,	25,	45,	60,	25,	25,	30),
           Duessel	= c(85,	55,	40,	30,	20,	45,	30),
           Knoll	= c(70,	50,	40,	35,	20,	10,	45),
           Myrrh	= c(130,	90,	85,	65,	30,	150,	30),
           Syrene	= c(70,	40,	50,	60,	30,	20,	50))))
colnames(growths) = c("Hp_g","SM_g","Skl_g","Spd_g","Lck_g","Def_g","Res_g")
write.csv(growths,"fe8Growths.csv",row.names = T)


bases <- data.frame(t(data.frame(Eirika=	c(1,	"Lord_F",	16,	4,	8,	9,	5,	3,	1,	5,	5),	
          Seth=	c(1,	"Paladin_M",	30,	14,	13,	12,	13,	11,	8,	8,	11),	
          Franz=	c(1,	"Cavalier_M",	20,	7,	5,	7,	2,	6,	1,	7,	9),	
          Gilliam=	c(4,	"Knight_M",	25,	9,	6,	3,	3,	9,	3,	4,	14),
          Vanessa=	c(1,	"PegasusKnight_F",	17,	5,	7,	11,	4,	6,	5,	7,	5),	
          Moulder=	c(3,	"Priest_M",	20,	4,	6,	9, 1,	2,	5,	5,	9),	
          Ross=	c(1,	"Journeyman_M",	15,	5,	2,	3,	8,	3,	0,	4,	8),	
          Garcia=	c(4,	"Fighter_M",	28,	8,	7,	7,	3,	5,	1,	5,	14),
          Neimi=	c(1,	"Archer_F",	17,	4,	5,	6,	4,	3, 2, 5,	5),	
          Colm=	c(2,	"Thief_M",	18,	4,	4,	10,	8,	3,	1,	6,	6),	
          Artur=	c(2,	"Monk_M",	19,	6, 6,	8,	2,	2,	6,	5,	6),	
          Lute=	c(1,	"Mage_F",	17,	6,	6,	7,	8,	3,	5,	5,	3),	
          Natasha=	c(1,	"Cleric_F",	18,	2,	4,	8,	6,	2,	6,	5,	4),	
          Joshua=	c(5,	"Myrmidon_M",	24,	8,	13,	14,	7,	5,	2,	5,	8),	
          Ephraim=	c(4,	"Lord_M",	23,	8,	9,	11,	8,	7,	2,	5,	8),	
          Forde=	c(6,	"Cavalier_M",	24,	7,	8,	8, 7,	8,	2,	7,	9),	
          Kyle=	c(5,	"Cavalier_M",	25,	9,	6,	7,	6,	9,	1,	7,	10),
          Tana=	c(4,	"PegasusKnight_F",	20,	7,	9,	13,	8,	6,	7,	7,	5),
          Amelia=	c(1,	"Recruit_F",	16,	4,	3,	4,	6,	2,	3,	4,	6),	
          Innes=	c(1,	"Sniper_M",	31,	14,	13,	15,	14,	10,	9,	6,	9),	
          Gerik=	c(10,	"Mercenary_M",	32,	14,	13,	13,	8,	10,	4,	5,	13),
          Tethys=	c(1,	"Dancer_F",	18,	1,	2,	12,	10,	5,	4,	5,	5	),
          Marisa=	c(5,	"Myrmidon_F",	23,	7,	12,	13,	9,	4,	3,	5,	5),	
          LArachel=	c(3,	"Troubadour_F",	18,	6,	6,	10,	12,	5,	8,	6,	5),	
          Dozla=	c(1,	"Berserker_M",	43,	16,	11,	9,	4,	11,	6,	6,	16),
          Saleh=	c(1,	"Sage_M",	30,	16,	18,	14,	11,	8,	13,	6,	8),	
          Ewan=	c(1,	"Pupil_M",	15,	3,	2,	5,	5,	0,	3,	4,	5),	
          Cormag=	c(9,	"WyvernRider_M",	30,	14,	9,	10,	4,	12,	2,	7,	11),	
          Rennac=	c(1,	"Rogue_M",	28,	10,	16,	17,	5,	9,	11,	6,	7),	
          Duessel=	c(8,	"GreatKnight_M",	41,	17,	12,	12,	8,	17,	9,	6,	15),	
          Knoll=	c(10,	"Shaman_M",	22,	13,	9,	8,	0,	2,	10,	5,	7),	
          Myrrh=	c(1,	"Manakete_F",	15,	3,	1,	5,	3,	2,	7,	6,	5),	
          Syrene=	c(1,	"Falcoknight_F",	27,	12,	13,	15,	12,	10,	12,	8,	7))))
colnames(bases) = c("Lv","Class","Hp_b","SM_b","Skl_b","Spd_b","Lck_b","Def_b","Res_b","Mov","Con")
write.csv(bases,"fe8Bases.csv",row.names = T)


main <- cbind(bases,growths)


class_data <-  data.frame(t(data.frame(
  Lord_F=c(Hp_promo=4,SM_promo=2,Skl_promo=2,Spd_promo=1,Def_promo=3,Res_promo=5,Con_promo=2,Mov_promo=2,
          weapon_types=1,mov_bonus=1,buffs=0,extrautil=0),
  Lord_M=c(Hp_promo=4,SM_promo=2,Skl_promo=3,Spd_promo=2,Def_promo=2,Res_promo=5,Con_promo=2,Mov_promo=2,
          weapon_types=1,mov_bonus=1,buffs=0,extrautil=0),
  Paladin_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
          weapon_types=2,mov_bonus=1,buffs=0,extrautil=0),
  Cavalier_M=c(Hp_promo=2.5,SM_promo=1.5,Skl_promo=1,Spd_promo=1.5,Def_promo=2,Res_promo=1,Con_promo=3,Mov_promo=0,
          weapon_types=2.5,mov_bonus=1,buffs=0,extrautil=0),
  Knight_M=c(Hp_promo=3.5,SM_promo=2,Skl_promo=1.5,Spd_promo=2.5,Def_promo=2,Res_promo=2,Con_promo=1,Mov_promo=1.5,
         weapon_types=3,mov_bonus=.5,buffs=0,extrautil=0),
  PegasusKnight_F=c(Hp_promo=4,SM_promo=1,Skl_promo=.5,Spd_promo=2,Def_promo=1.5,Res_promo=1.5,Con_promo=2.5,Mov_promo=1,
         weapon_types=1.5,mov_bonus=1.5,buffs=0,extrautil=0),
  Priest_M=c(Hp_promo=3.5,SM_promo=1.5,Skl_promo=0.5,Spd_promo=0,Def_promo=3,Res_promo=2.5,Con_promo=2,Mov_promo=1,
         weapon_types=1.5,mov_bonus=0,buffs=1,extrautil=.5),
  Journeyman_M=c(Hp_promo=5.5,SM_promo=3,Skl_promo=2.25,Spd_promo=1,Def_promo=3,Res_promo=3,Con_promo=4.5,Mov_promo=2,
         weapon_types=1.75,mov_bonus=.25,buffs=0,extrautil=.25),
  Fighter_M=c(Hp_promo=3.5,SM_promo=1,Skl_promo=2,Spd_promo=1,Def_promo=2.5,Res_promo=2.5,Con_promo=1,Mov_promo=1,
         weapon_types=2,mov_bonus=0,buffs=0,extrautil=0),
  Archer_F=c(Hp_promo=3,SM_promo=2.5,Skl_promo=1.5,Spd_promo=1,Def_promo=2.5,Res_promo=2.5,Con_promo=2,Mov_promo=1.5,
              weapon_types=1.5,mov_bonus=.5,buffs=0,extrautil=0),
  Thief_M=c(Hp_promo=2.5,SM_promo=1,Skl_promo=0.5,Spd_promo=0,Def_promo=2,Res_promo=2,Con_promo=1.5,Mov_promo=0,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=1.5),
  Monk_M=c(Hp_promo=3.5,SM_promo=1.5,Skl_promo=0.5,Spd_promo=0,Def_promo=3,Res_promo=2.5,Con_promo=1,Mov_promo=1,
              weapon_types=1.5,mov_bonus=0,buffs=1,extrautil=.5),
  Mage_F=c(Hp_promo=3,SM_promo=1.5,Skl_promo=1,Spd_promo=0,Def_promo=2.5,Res_promo=2.5,Con_promo=2,Mov_promo=1.5,
              weapon_types=1.5,mov_bonus=.5,buffs=1,extrautil=0),
  Cleric_F=c(Hp_promo=3.5,SM_promo=1,Skl_promo=1,Spd_promo=0.5,Def_promo=2,Res_promo=2.5,Con_promo=1.5,Mov_promo=1.5,
              weapon_types=1,mov_bonus=.5,buffs=1,extrautil=.5),
  Myrmidon_M=c(Hp_promo=4,SM_promo=1.5,Skl_promo=0,Spd_promo=0,Def_promo=2,Res_promo=1.5,Con_promo=1,Mov_promo=0.5,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=1),
  Recruit_F=c(Hp_promo=3.5,SM_promo=1.75,Skl_promo=3,Spd_promo=3.5,Def_promo=3,Res_promo=2.75,Con_promo=4,Mov_promo=2.25,
              weapon_types=2.75,mov_bonus=.75,buffs=0,extrautil=0),
  Sniper_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=0),
  Mercenary_M=c(Hp_promo=3.5,SM_promo=1.5,Skl_promo=1.5,Spd_promo=1.5,Def_promo=2.5,Res_promo=2.5,Con_promo=1,Mov_promo=1.5,
              weapon_types=2,mov_bonus=.5,buffs=0,extrautil=0),
  Dancer_F=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=0,mov_bonus=0,buffs=2,extrautil=0),
  Myrmidon_F=c(Hp_promo=3,SM_promo=1.5,Skl_promo=1,Spd_promo=0.5,Def_promo=2,Res_promo=1,Con_promo=1.5,Mov_promo=1,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=1),
  Troubadour_F=c(Hp_promo=3,SM_promo=2,Skl_promo=1,Spd_promo=0,Def_promo=2,Res_promo=2.5,Con_promo=1,Mov_promo=1,
              weapon_types=1,mov_bonus=1,buffs=1,extrautil=0),
  Berserker_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=1),
  Sage_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=2,mov_bonus=0,buffs=1,extrautil=0),
  Pupil_M=c(Hp_promo=4.75,SM_promo=1.75,Skl_promo=.75,Spd_promo=3,Def_promo=3,Res_promo=4.5,Con_promo=2.75,Mov_promo=2.25,
              weapon_types=1.5,mov_bonus=.25,buffs=1,extrautil=3/4),
  WyvernRider_M=c(Hp_promo=3.5,SM_promo=1.5,Skl_promo=2,Spd_promo=1.5,Def_promo=1,Res_promo=0.5,Con_promo=0.5,Mov_promo=1,
              weapon_types=1.5,mov_bonus=1.5,buffs=0,extrautil=.5),
  Rogue_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=1,mov_bonus=0,buffs=0,extrautil=2),
  GreatKnight_M=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=3,mov_bonus=1,buffs=0,extrautil=0),
  Shaman_M=c(Hp_promo=3.5,SM_promo=0,Skl_promo=0.5,Spd_promo=3,Def_promo=1.5,Res_promo=2.5,Con_promo=1,Mov_promo=1,
              weapon_types=1.5,mov_bonus=0,buffs=1,extrautil=3/2),
  Manakete_F=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=1,mov_bonus=.5,buffs=0,extrautil=1),
  Falcoknight_F=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
              weapon_types=2,mov_bonus=1.5,buffs=0,extrautil=0)
)))


mainp2 <- data.frame(t(data.frame(setup=c(Hp_promo=0,SM_promo=0,Skl_promo=0,Spd_promo=0,Def_promo=0,Res_promo=0,Con_promo=0,Mov_promo=0,
             weapon_types=0,mov_bonus=0,buffs=0,extrautil=0))))
for(unit in main$Class){
  mainp2 <- rbind(mainp2,class_data[unit,])
}
mainp2=mainp2[-1,]
rownames(mainp2)=rownames(main)
main <- cbind(main,mainp2)
rm(mainp2)



#Hp_promo <- c(4,0,2.5,3.5,4,3.5,5.5,3.5,3,2.5,3.5,3,3.5,4,4,2.5,2.5,4,3.5,0,3.5,0,3,3,0,0,19/4,3.5,0,0,3.5,0,0)
#SM_promo <- c(2,0,1.5,2,1,1.5,3,1,2.5,1,1.5,1.5,1,1.5,2,1.5,1.5,2,7/4,0,1.5,0,1.5,2,0,0,7/4,1.5,0,0,0,0,0)
#Skl_promo <- c(2,0,1,1.5,.5,.5,9/4,2,1.5,.5,.5,1,1,0,3,1,1,.5,3,0,1.5,0,1,1,0,0,3/4,2,0,0,.5,0,0)
#Spd_promo <- c(1,0,1.5,2.5,2,0,1,1,1,0,0,0,.5,0,2,1,1,2,3.5,0,1.5,0,.5,0,0,0,3,1.5,0,0,3,0,0)
#Def_promo <- c(3,0,2,2,1.5,3,3,2.5,2.5,2,3,2.5,2,2,2,2,2,1.5,3,0,2.5,0,2,2,0,0,3,1,0,0,1.5,0,0)
#Res_promo <- c(5,0,1,2,1.5,2.5,3,2.5,2.5,2,2.5,2.5,2.5,1.5,5,1,1,1.5,11/4,0,2.5,0,1,2.5,0,0,4.5,.5,0,0,2.5,0,0)
#Con_promo <- c(2,0,3,1,2.5,2,18/4,1,2,1.5,1,2,1.5,.5,2,1,1,2.5,4,0,1,0,1.5,1,0,0,11/4,.5,0,0,1,0,0)
#Mov_promo <- c(2,0,0,1.5,1,1,2,1,1.5,0,1,1.5,1.5,1,2,0,0,1,9/4,0,1.5,0,1,1,0,0,9/4,1,0,0,1,0,0) 


#main <- main %>% cbind(Hp_promo) %>% cbind(SM_promo) %>% cbind(Skl_promo) %>% cbind(Spd_promo) %>% cbind(Def_promo) %>% 
  #cbind(Res_promo) %>% cbind(Con_promo) %>% cbind(Mov_promo)



#weapon_types = c(1,2,2.5,3,1.5,1.5,1.75,2,1.5,1,1.5,1.5,1,1,1,2.5,2.5,1.5,2.75,1,1.5,0,1,1,1,2,1.5,1.5,1,3,1.5,1,2)
#horse = c(1,1,1,.5,1,0,0,0,.5,0,0,.5,.5,0,1,1,1,1,.75,0,.5,0,0,1,0,0,.25,1,0,1,0,1,1)
#extrautil = c(0,0,0,0,.25,1,.0625,0,0,.75,1,1,1,.25,0,0,0,.25,0,0,0,2,.25,1,.25,1,1.125,.25,1,0,1.25,.25,.25)

score = c(4.5,10,8.5,6.5,8.5,3.5,6.5,7,4.5,4,5,8,4.5,5,9.5,6,7.5,8.5,1,3.5,9,8,1.5,7,4,8.5,6,8,4,9.5,3.5,7,5)
avail = (21-c(0,0,1,1,2,2,2,2,3,3,4,4,5,5,8,8,8,9,9,12.5,11.5,11.5,11,11,11,13.5,12,11.5,14,12.5,15,16,17))/21
Lv_from_max = c(39,19,39,36,39,37,49,36,39,38,38,39,39,35,36,34,35,36,49,19,30,19,35,37,19,19,49,31,19,12,30,19,19)
char_colors = c("#18D8E8","#B81008","#B8E050","#308890","#38D838","#C05828","#1058C0","#78B8C8","#E84098","#383858","#00F0F4","#B028D8",
                "#00F0F4","#E00000","#10C8B0","#C05828","#0B790B","#96CCDC","#E84818","#64F7F1","#983068","#C81818","#D050D8",
                "#B0F028","#EE5D36","#C0E090","#E00000","#457E8E","#C06030","#987898","#764AA0","#583068","#2DBF2E")

#main <- main %>% cbind(weapon_types) %>% cbind(horse) %>% cbind(extrautil) %>% cbind(avail) %>% cbind(Lv_from_max) %>% cbind(char_colors)
main <- main %>% cbind(score) %>% cbind(avail) %>%  cbind(Lv_from_max) %>% cbind(char_colors) %>% mutate(game="fe8")
write.csv(main,"fe8CharData.csv",row.names = T)

setwd("..")
