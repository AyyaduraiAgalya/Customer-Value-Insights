-- Create customers table
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Year_Birth INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(10, 2),
    Kidhome INT,
    Teenhome INT,
    Recency INT,
    MntWines DECIMAL(10, 2),
    MntFruits DECIMAL(10, 2),
    MntMeatProducts DECIMAL(10, 2),
    MntFishProducts DECIMAL(10, 2),
    MntSweetProducts DECIMAL(10, 2),
    MntGoldProds DECIMAL(10, 2),
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    Response INT,
    RFM_Score INT,
    Segment VARCHAR(50)
);

-- Create feedback table
CREATE TABLE feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Feedback TEXT,
    Rating INT,
    Sentiment DECIMAL(3, 2),
    Sentiment_Label VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);
