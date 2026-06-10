data_table5<-read_excel("C:\\Users\\Ripple\\Downloads\\cw_r.xlsx", sheet ="Table 5", skip=5)
colnames(data_table5)<-c("Area_Code","Region","Total_Offences","Offence_Rate_per_1000", "Percentage_Change")
View(data_table5)
# England only data frame
data_table5 <- data_table5 %>% 
  filter((!is.na(Region) & !grepl("Link|Source", Region) & grepl("^E12", Area_Code))) %>%
  mutate(Total_Offences=as.numeric(Total_Offences),
         Offence_Rate_per_1000 = as.numeric(Offence_Rate_per_1000),
         Region = gsub("\\[note\\s\\d+\\]", "",Region))
View(data_table5)
region_summary <-data_table5 %>%
group_by(Region) %>% 
summarise(Total_Offences = sum(Total_Offences, na.rm = TRUE),
          Mean_Offence_Rate =mean(Offence_Rate_per_1000, na.rm = TRUE))
View(region_summary)
ggplot(region_summary, 
       aes(x = reorder(Region, -Total_Offences),
           y = Total_Offences)) +
  geom_bar(
    stat = "identity", fill = "steelblue")+
  coord_flip() +
  ggtitle("Total Offences by Region") + 
  xlab("Region") + 
  ylab("Total Offences")+
  theme_minimal()