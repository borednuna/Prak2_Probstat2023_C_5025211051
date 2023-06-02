# 1
# a.  Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas
X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)
D <- Y - X
sd_D <- sd(D)
print(sd_D)

# b. Carilah nilai t (p-value)
result <- t.test(D)
t_value <- result$statistic
print(t_value)
p_value <- result$p.value
print(p_value)

# c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴”.
if (p_value <= 0.05) {
  print("Terdapat pengaruh yang signifikan secara statistika")
} else {
  print("Tidak terdapat pengaruh yang signifikan secara statistika")
}

# 2
# a. Apakah Anda setuju dengan klaim tersebut? Jelaskan.
mu = 25000
n = 100
xbar = 23500
sdx = 3900
# c. Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

# 3
# b. Hitung sampel statistik
library(stats)
jumlah_saham_bandung <- 20
jumlah_saham_bali <- 27
sampel_mean_bandung <- 3.64
sampel_mean_bali <- 2.79
sampel_sd_bandung <- 1.67
sampel_sd_bali <- 1.5
n_bandung <- jumlah_saham_bandung
n_bali <- jumlah_saham_bali

sampel_statistik <- (sampel_mean_bandung - sampel_mean_bali) / sqrt((sampel_sd_bandung^2/n_bandung) + (sampel_sd_bali^2/n_bali))
print(sampel_statistik)

# c. Lakukan uji statistik (df =2)
df <- 2
p_value <- pt(sampel_statistik, df = df, lower.tail = FALSE)
print(p_value)

# d. Nilai kritikal
library(stats)
alpha <- 0.05
df <- 2
kritikal <- qt(1 - alpha, df = df)
print(kritikal)

# e. Keputusan
# f. Kesimpulan

# 4
data = read.csv("/home/nuna/Prak2_Probstat2023_C_5025211051/GTL.csv")

# a. Buatlah plot sederhana untuk visualisasi data
install.packages("ggplot2")
library(ggplot2)
pl = ggplot2::ggplot(data=data, aes(x=Temp, y=Light, shape=factor(Glass))) + geom_point()
pl + facet_grid(. ~ Glass)

# b. Lakukan uji ANOVA dua arah.
data$Glass = as.factor(data$Glass)
data$Temp_Factor = as.factor(data$Temp)
anova = aov(Light ~ Glass*Temp_Factor, data=data)
summary(anova)

# c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi).
install.packages("dplyr")
library(dplyr)
data_summary = group_by(data, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
