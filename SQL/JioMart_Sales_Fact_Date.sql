CREATE DATABASE Jiomart_Analysis;
GO

USE Jiomart_Analysis;
GO

CREATE SCHEMA raw;
GO

CREATE SCHEMA Clean;
GO

CREATE SCHEMA Reporting;
GO

ALTER SCHEMA raw
TRANSFER dbo.Jiomart_Data;

SELECT COUNT(*) AS TotalRows
FROM raw.Jiomart_Data;

CREATE TABLE Clean.Jiomart_Clean(
    Transaction_ID NVARCHAR(50),
    Order_Date DATE,
    Year INT,
    Quarter NVARCHAR(2),
    Month_No INT,
    Month_Name NVARCHAR(20),
    Week_No INT,
    Day_Name NVARCHAR(20),
    Financial_Year NVARCHAR(20),

    Region NVARCHAR(50),
    State NVARCHAR(50),
    City NVARCHAR(100),

    Store_ID NVARCHAR(50),
    Store_Name NVARCHAR(150),
    Store_Format NVARCHAR(100),
    Store_Manager NVARCHAR(100),
    Channel NVARCHAR(50),
    Order_Type NVARCHAR(50),

    Customer_ID NVARCHAR(50),
    Customer_Name NVARCHAR(150),
    Customer_Segment NVARCHAR(50),
    Gender NVARCHAR(20),
    Age_Group NVARCHAR(30),
    Loyalty_Tier NVARCHAR(50),
    New_Or_Repeat NVARCHAR(20),

    Product_ID NVARCHAR(50),
    Category NVARCHAR(100),
    Sub_Category NVARCHAR(100),
    Product_Name NVARCHAR(200),
    Brand NVARCHAR(100),
    Product_Type NVARCHAR(100),
    SKU_Size NVARCHAR(50),

    Unit_MRP DECIMAL(18,2),
    Selling_Price DECIMAL(18,2),
    Quantity INT,

    Gross_Sales DECIMAL(18,2),
    Discount_Percent DECIMAL(18,2),
    Discount_Amount DECIMAL(18,2),

    Coupon_Code NVARCHAR(50),

    Net_Sales DECIMAL(18,2),

    GST_Percent DECIMAL(18,2),
    GST_Amount DECIMAL(18,2),

    Total_Invoice_Value DECIMAL(18,2),

    Cost_Per_Unit DECIMAL(18,2),
    COGS DECIMAL(18,2),

    Gross_Profit DECIMAL(18,2),
    Gross_Margin_Percent DECIMAL(18,2),

    Payment_Mode NVARCHAR(50),
    Delivery_Mode NVARCHAR(50),

    Delivery_Distance_KM DECIMAL(10,2),
    Delivery_Charge DECIMAL(18,2),

    Return_Flag NVARCHAR(10),
    Return_Reason NVARCHAR(100),
    Return_Amount DECIMAL(18,2),

    Stock_On_Hand INT,
    Reorder_Level INT,
    Stock_Status NVARCHAR(50),

    Campaign_Name NVARCHAR(100),
    Marketing_Source NVARCHAR(100),
    Ad_Spend_Allocated DECIMAL(18,2),

    Customer_Rating DECIMAL(3,1),
    NPS_Score INT,

    Competitor_Name NVARCHAR(100),
    Competitor_Price DECIMAL(18,2),
    Price_Index_vs_Competitor DECIMAL(18,2),

    Basket_Size_Band NVARCHAR(50),
    Profitability_Band NVARCHAR(50),
    Service_SLA_Status NVARCHAR(50),

    Delivery_Time_Minutes INT
);

INSERT INTO Clean.Jiomart_Clean
SELECT
Transaction_ID,
TRY_CONVERT(DATE,Order_Date),
TRY_CONVERT(INT,Year),
Quarter,
TRY_CONVERT(INT,Month_No),
Month_Name,
TRY_CONVERT(INT,Week_No),
Day_Name,
Financial_Year,
  
Region,
State,
City,
Store_ID,
Store_Name,
Store_Format,
Store_Manager,
Channel,
Order_Type,

Customer_ID,
Customer_Name,
Customer_Segment,
Gender,
Age_Group,
Loyalty_Tier,
New_Or_Repeat,

Product_ID,
Category,
Sub_Category,
Product_Name,
Brand,
Product_Type,
SKU_Size,
TRY_CONVERT(DECIMAL(18,2),Unit_MRP),
TRY_CONVERT(DECIMAL(18,2),Selling_Price),
TRY_CONVERT(INT,Quantity),
TRY_CONVERT(DECIMAL(18,2),Gross_Sales),
TRY_CONVERT(DECIMAL(18,2),Discount_Percent),
TRY_CONVERT(DECIMAL(18,2),Discount_Amount),
  
Coupon_Code,
TRY_CONVERT(DECIMAL(18,2),Net_Sales),
TRY_CONVERT(DECIMAL(18,2),GST_Percent),
TRY_CONVERT(DECIMAL(18,2),GST_Amount),
TRY_CONVERT(DECIMAL(18,2),Total_Invoice_Value),
TRY_CONVERT(DECIMAL(18,2),Cost_Per_Unit),
TRY_CONVERT(DECIMAL(18,2),COGS),
TRY_CONVERT(DECIMAL(18,2),Gross_Profit),
TRY_CONVERT(DECIMAL(18,2),Gross_Margin_Percent),

Payment_Mode,
Delivery_Mode,
TRY_CONVERT(DECIMAL(10,2),Delivery_Distance_KM),
TRY_CONVERT(DECIMAL(18,2),Delivery_Charge),

Return_Flag,
Return_Reason,
TRY_CONVERT(DECIMAL(18,2),Return_Amount),
TRY_CONVERT(INT,Stock_On_Hand),
TRY_CONVERT(INT,Reorder_Level),
  
Stock_Status,
Campaign_Name,
  
Marketing_Source,
TRY_CONVERT(DECIMAL(18,2),Ad_Spend_Allocated),
TRY_CONVERT(DECIMAL(3,1),Customer_Rating),
TRY_CONVERT(INT,NPS_Score),
  
Competitor_Name,
TRY_CONVERT(DECIMAL(18,2),Competitor_Price),
TRY_CONVERT(DECIMAL(18,2),Price_Index_vs_Competitor),

Basket_Size_Band,
Profitability_Band,
  
Service_SLA_Status,
TRY_CONVERT(INT,Delivery_Time_Minutes)

FROM raw.Jiomart_Data;

--views--
CREATE VIEW Reporting.vw_SalesFact
AS
SELECT

Transaction_ID,

Order_Date,
Year,
Quarter,
Month_No,
Month_Name,

Region,
State,
City,

Store_ID,
Store_Name,
Store_Format,
Channel,
Order_Type,

Customer_ID,
Customer_Name,
Customer_Segment,
Gender,
Age_Group,
Loyalty_Tier,
New_Or_Repeat,

Product_ID,
Category,
Sub_Category,
Product_Name,
Brand,
Product_Type,

Quantity,

Unit_MRP,
Selling_Price,

Gross_Sales,
Discount_Percent,
Discount_Amount,

Net_Sales,

Cost_Per_Unit,
COGS,

Gross_Profit,
Gross_Margin_Percent,

Payment_Mode,
Delivery_Mode,

Delivery_Distance_KM,
Delivery_Charge,
Delivery_Time_Minutes,

Return_Flag,
Return_Reason,
Return_Amount,

Customer_Rating,
NPS_Score

FROM Clean.Jiomart_Clean;
GO

SELECT COUNT(*)
FROM Reporting.vw_SalesFact;

SELECT COUNT(*) FROM Reporting.vw_SalesFact;
