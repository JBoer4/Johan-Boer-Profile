library(tidyverse)
library(fmsb)

# Import Datasets
main = read.csv("data//fe8CharData.csv")
rownames(main) = main$X
main = main %>% select(-1)

bases = read.csv("data//fe8Bases.csv")
rownames(bases) = bases$X
bases = bases %>% select(-1)

growths = read.csv("data//fe8Growths.csv")
rownames(growths) = growths$X
growths = growths %>% select(-1)




# Create Data for radar plots 

# Bases
bases_n <- bases %>% select(c(3:9))

max = c()
min = c()
for(i in c(1:length(bases[1,]))){
  max = append(max,max(bases_n[,i]))
  min = append(min,min(bases_n[,i]))
}

max_min_bases <- rbind(min,bases_n) %>% 
  rbind(max,.)
rownames(max_min_bases)[c(1,2)] = c("Max","Min")
rm(max,min,i)
max_min_bases <- max_min_bases[,c(1,6,7,5,4,3,2)]




# Growths
noOutlier = growths[-32,]

max = c()
min = c()
for(i in c(1:length(noOutlier[1,]))){
  max = append(max,max(noOutlier[,i]))
  min = append(min,min(noOutlier[,i]))
}

max_min_growths <- rbind(min,growths) %>% 
  rbind(max,.)
rownames(max_min_growths)[c(1,2)] = c("Max","Min")
rm(max,min,i)
max_min_growths <- max_min_growths[,c(1,6,7,5,4,3,2)]




# Character Stats
CStats = main %>% 
  summarise(baseStats = Hp_b+7/2*SM_b+7/4*Skl_b+3*Spd_b+7/5*Lck_b+7/3*Def_b+7/3*Res_b,
            growthPotential = Lv_from_max/100*(Hp_g+7/2*SM_g+7/4*Skl_g+3*Spd_g+7/5*Lck_g+7/3*Def_g+7/3*Res_g)+
              (Hp_promo+7/2*SM_promo+7/4*Skl_promo+3*Spd_promo+7/3*Def_promo+7/3*Res_promo+Mov_promo),
            availability = avail,
            utility = (Mov+Mov_promo)/8+mov_bonus+2.5*buffs+extrautil+1/2*weapon_types,
            durability = 1*(Hp_b+Hp_g/200*Lv_from_max+Hp_promo)+1.25*(Def_b+Def_g/200*Lv_from_max+Def_promo)+
              1.3*(Res_b+Res_g/200*Lv_from_max+Res_promo)+1/4*(Spd_b+Spd_g/200*Lv_from_max+Spd_promo),
            offense = 2.5*(SM_b+SM_g/200*Lv_from_max+SM_promo+1/4*(Con+Con_promo))+
              .75*(Spd_b+Spd_g/200*Lv_from_max+Spd_promo)+2*weapon_types)

rownames(CStats) <- rownames(main)

max = c()
min = c()
for(i in c(1:length(CStats[1,]))){
  max = append(max,max(CStats[,i]))
  min = append(min,min(CStats[,i]))
}

max_min_CStats <- rbind(min,CStats) %>% 
  rbind(max,.)
rownames(max_min_CStats)[c(1,2)] = c("Max","Min")
rm(max,min,i)









# Start Plotting
create_beautiful_radarchart <- function(data, color = "#00AFBB", 
                                        vlabels = colnames(data), vlcex = 1,
                                        caxislabels = NULL, title = NULL, ...){
  radarchart(
    data,
    # Customize the polygon
    pcol = color, pfcol = scales::alpha(color, 0.65), plwd = 2, plty = 1,
    cglty = 1,
    # Variable labels
    vlcex = vlcex, vlabels = vlabels,
    caxislabels = caxislabels, title = title, ...
  )
}



simpleChart <- function(data,name,clr = "black"){
  create_beautiful_radarchart(data[append(c("Max","Min"),name),],title=name,color=clr)
}

# Example Plot
#simpleChart(max_min_bases,c("Dozla","Seth","Duessel"))

# Plot Parameters
op <- par(mar=c(1,1,1,1))
par(mfrow=c(2,3))

# Plot all Bases
for(name in rownames(bases_n)){
  simpleChart(max_min_bases,name,"brown2")
}

# Plot all Growths
for(name in rownames(bases_n)){
  simpleChart(max_min_growths,name,"cyan3")
}

# Plot all CStats
for(name in rownames(main)){
  simpleChart(max_min_CStats,name,main[name,"char_colors"])
}
par(op)


layout(matrix(c(1,1,2,1,1,3), 2, 3, byrow = TRUE))
simpleChart(max_min_CStats,"Eirika",main["Eirika","char_colors"]) 
simpleChart(max_min_bases,"Eirika","ivory4")
simpleChart(max_min_growths,"Eirika","gold2")


cplot <- function(name){
  layout(matrix(c(1,1,2,1,1,3), 2, 3, byrow = TRUE))
  create_beautiful_radarchart(max_min_CStats[c("Max","Min",name),],title=name,color=main[name,"char_colors"],
                              vlabels = c("Base Stats","Potential for Growth","Availability","Non-Combat Utility","Durability","Offensive Capability"))
  
  create_beautiful_radarchart(max_min_bases[c("Max","Min",name),],title="Bases",color="ivory4",
                              vlabels = c("HP","Def","Res","Lck","Spd","Skl","S/M"))
  
  create_beautiful_radarchart(max_min_growths[c("Max","Min",name),],title="Growths",color="gold2",
                              vlabels = c("HP","Def","Res","Lck","Spd","Skl","S/M"))
}



