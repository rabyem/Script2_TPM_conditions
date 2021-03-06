setwd("C:/Users/Owner/Script2_iGA")
source("iGAaccurate.R")
source("db_iGAaccurate.R")
library(Rmpfr)

##Ensure 'decreasing' = 'F' if genes are repressed

metric <- read.csv("metric.csv", row.names = 1, header = F)
group_membership <- read.csv("group_membership.csv", row.names = 1)
group_membership <- as.matrix(group_membership)
groups <- colnames(group_membership)
decreasing <- F
var.names <- rownames(metric)

out<- iGA_acc(metric = metric[,1],
              group.membership = group_membership,
              var.names = var.names,
              groups = groups,
              decreasing = decreasing)

write.csv(out$summary, file="outputiGA_tmp.csv", row.names = F)
