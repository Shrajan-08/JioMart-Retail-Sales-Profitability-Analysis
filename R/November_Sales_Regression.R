jio <- jio %>%
  mutate(
    Order_Date = as.Date(Order_Date),
    Net_Sales = as.numeric(Net_Sales),
    Selling_Price = as.numeric(Selling_Price),
    Quantity = as.numeric(Quantity),
    Discount_Percent = as.numeric(Discount_Percent),
    Month_No = as.numeric(Month_No),
    Category = as.factor(Category),
    Channel = as.factor(Channel),
    Store_Format = as.factor(Store_Format)
  )

jio <- jio %>%
  mutate(
    November = ifelse(Month_No == 11, 1, 0)
  )

table(jio$November)

model <- lm(
  log(Net_Sales) ~
    Quantity +
    Selling_Price +
    Discount_Percent +
    Category +
    Channel +
    Store_Format +
    November,
  data = jio
)

summary(model)

regression_results <- tidy(model)

regression_results
