-- Identify high-value customers
SELECT ID, Income, RFM_Score, Segment,
       (MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS TotalSpend
FROM customers
WHERE Segment = 'High Value'
ORDER BY TotalSpend DESC
LIMIT 10;

-- Sentiment analysis by customer segment
SELECT c.Segment, AVG(f.Sentiment) AS Avg_Sentiment, COUNT(f.Feedback) AS Feedback_Count
FROM customers c
JOIN feedback f ON c.ID = f.CustomerID
GROUP BY c.Segment
ORDER BY Avg_Sentiment DESC;

-- Recent buyers with negative sentiment
SELECT c.ID, c.Recency, f.Feedback, f.Rating, f.Sentiment_Label
FROM customers c
JOIN feedback f ON c.ID = f.CustomerID
WHERE c.Recency < 30 AND f.Sentiment_Label = 'Negative'
ORDER BY c.Recency;

-- Spending behavior based on feedback sentiment
SELECT f.Sentiment_Label, AVG(c.MntWines + c.MntFruits + c.MntMeatProducts + c.MntFishProducts + c.MntSweetProducts + c.MntGoldProds) AS Avg_TotalSpend
FROM customers c
JOIN feedback f ON c.ID = f.CustomerID
GROUP BY f.Sentiment_Label
ORDER BY Avg_TotalSpend DESC;

-- Campaign response analysis by segment
SELECT Segment,
       COUNT(Response) AS Total_Responses,
       SUM(Response) AS Positive_Responses,
       (SUM(Response) / COUNT(Response)) * 100 AS Response_Rate
FROM customers
GROUP BY Segment
ORDER BY Response_Rate DESC;
