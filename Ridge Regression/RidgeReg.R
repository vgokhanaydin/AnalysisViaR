#Ridge regresyon kütüphanesini projeye dahil etme
library(lmridge)

#"k" değerinin hesaplanması
kridge <- lmridge(y ~ ., K = seq(0, 0.1, 0.007), data = veri)
plot(kridge, type="ridge")

#Belirlenen "k" değerine göre ridge regresyon analizi uygulanması
rreg <- lmridge(y ~ ., K = 0.007, scaling=c("sc"), data = veri)
summary(rreg)