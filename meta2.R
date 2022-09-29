smd_meta <- data.frame(
  id = c("005","005","029","031","038","041","041","058","058","067","067"),
  study = c(1,2,3,1,1,1,2,1,2,1,2),
  author_year = c("Ruva,2007","Ruva,2007","Chrzanowski 2006","Studebaker 2000","Ruva 2008",
                  "Bradshaw 2007","Bradshaw 2007","Wilson 1998","Wilson 1998","Locatelli 2011",
                  "Locatelli 2011"),
  n1 = c(138,140,144,21,54,78,92,31,29,90,181),
  n2 = c(138,142,234,21,52,20,18,15,13,29,53),
  m1 = c(5.29,5.05,1.97,5.95,5.07,6.22,5.47,6.13,5.69,4.81,4.83),
  m2 = c(4.08,3.89,2.45,3.67,3.96,5.75,4.89,3.80,3.61,4.61,4.51),
  sd1 = c(1.65,1.50,1.08,1.02,1.65,2.53,2.31,2.51,2.51,1.20,1.19),
  sd2 = c(1.67,1.61,1.22,1.20,1.76,2.17,2.59,2.68,2.78,1.39,1.34)
)

library(meta)

m1 <- metacont(n1, m1, sd1, n2, m2, sd2, data = smd_meta, sm="SMD")
mu1 <- update(m1, subgroup = author_year, subgroup.name = "Author Year")
mb1 <- metabind(mu1)

forest(mu1)
funnel(mu1)
forest(m1)
funnel(m1, studlab = TRUE, pch = 16, lwd = 0.5, , cex.studlab = 0.8)
cc <- funnel(m1, fixed = TRUE,
             level = 0.95, contour = c(0.9, 0.95, 0.99),
             col.contour = c("darkgreen", "green", "lightgreen"),
             lwd = 2, cex = 2, pch = 16, studlab = TRUE, cex.studlab = 1.25)
drapery(m1)
metabias(m1, plotit = TRUE)
