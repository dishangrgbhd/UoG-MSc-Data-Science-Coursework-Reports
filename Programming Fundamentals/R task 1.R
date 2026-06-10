library(dplyr)
library(ggplot2)
install.packages("readxl")
library(readxl)
library(tidyr)
file_path<- "C:\\Users\\Ripple\\Downloads\\cw_r.xlsx"
df_banking <- read_excel(file_path, sheet ="Table 3d", skip=8, n_max = 6) %>% slice(2:6)%>% select(1:11)
View(df_banking)
colnames(df_banking)<-c("Banking and credit industry Frauds","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021")
df_banking_long <- df_banking %>%
  pivot_longer(
    cols = `2012`:`2021`,
    names_to = "Year",
    values_to = "Count"
  ) %>%
  mutate(
    Year = as.factor(Year)
  )
View(df_banking_long)
ggplot(df_banking_long, aes(x = Year, y = Count)) +
  geom_boxplot(fill="lightblue")+ geom_jitter(width =0.2, color = "darkblue")+
  scale_y_log10()+
  ggtitle("Banking and Credit Industry Fraud Dispersion and Central Tendency")+
    xlab("Year")+
    ylab("Fraud Count")
  )+theme_minimal()

