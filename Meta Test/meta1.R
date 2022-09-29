smd_meta <- data.frame(
  id = c("005","005","029","031","038","041","041","058","058","067","067"),
  study = c(1,2,3,1,1,1,2,1,2,1,2),
  author_year = c("Ruva 2007","Ruva,2007","Chrzanowski 2006","Studebaker 2000","Ruva 2008",
                  "Bradshaw 2007","Bradshaw 2007","Wilson 1998","Wilson 1998","Locatelli 2011",
                  "Locatelli 2011"),
  n1 = c(138,140,144,21,54,78,92,31,29,90,181),
  n2 = c(138,142,234,21,52,20,18,15,13,29,53),
  m1 = c(5.29,5.05,1.97,5.95,5.07,6.22,5.47,6.13,5.69,4.81,4.83),
  m2 = c(4.08,3.89,2.45,3.67,3.96,5.75,4.89,3.80,3.61,4.61,4.51),
  sd1 = c(1.65,1.50,1.08,1.02,1.65,2.53,2.31,2.51,2.51,1.20,1.19),
  sd2 = c(1.67,1.61,1.22,1.20,1.76,2.17,2.59,2.68,2.78,1.39,1.34)
)

or_meta <- data.frame(
  id = c("001","003","005","005","011","016","025","025","035","039","045","064","064"),
  study = c(1,5,1,2,1,1,1,2,1,1,1,1,2),
  author_year = c("Bruschke 1999","Finkelstein 1995","Ruva 2007","Ruva 2007","Freedman 1996",
                  "Keelen 1979","Davis 1986","Davis 1986","Padawer-Singer 1974","Eimermann 1971",
                  "Jacquin 2001","Ruva 2006","Ruva 2006"),
  tg = c(58,26,67,90,36,37,17,17,47,15,133,68,53),
  cg = c(49,39,22,50,12,33,19,17,33,11,207,29,44),
  tn = c(72,60,138,140,99,120,60,55,60,40,136,87,74),
  cn = c(62,90,138,142,54,120,52,57,60,44,228,83,73)
)

library(metafor)

smd_meta <- escalc(measure="SMD", m1i=m1, m2i=m2, sd1=sd1, sd2i=sd2, n1i=n1, n2i=n2, data=smd_meta)
smd.rma <- rma(yi,vi,method="HE", data=smd_meta, slab = paste(author_year, study, sep=" Study "))
summary(smd.rma)

#Diger tahminleyiciler/Other Estimators
#smd.rma.dl <- rma(yi,vi,method = "DL", data=smd_meta)
#smd.rma.reml <- rma(yi,vi,method="REML", data=smd_meta)

forest(smd.rma)
funnel(smd.rma)

fsn(yi, vi, data=smd_meta)
