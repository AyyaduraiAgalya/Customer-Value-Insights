# CustomerValueInsights

## Overview
CustomerValueInsights is a comprehensive data science project focused on customer segmentation and propensity modeling. The project leverages machine learning techniques to gain insights into customer behavior and develop predictive models to enhance customer value and optimize business decisions.

## Project Structure
- `data/`: Contains raw and processed data files.
- `notebooks/`: Jupyter notebooks for each step of the project.
- `scripts/`: Python scripts for data processing, feature engineering, model development, and evaluation.
- `sql/`: Includes SQL scripts for creating tables and running analytical queries.
- `models/`: Trained models and feature selectors.
- `requirements.txt`: List of dependencies.
- `README.md`: Project documentation.

## Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/CustomerValueInsights.git
   cd CustomerValueInsights
   
2. Create and activate virtual environment:
   ```sh
   python3 -m venv venv
   source venv/bin/activate
   
3. Install the required packages:
   ```sh
   pip install -r requirements.txt

## Usage
- Run the Jupyter notebooks in notebooks/ to follow the data processing and modeling steps.
- Use the scripts in scripts/ for automated data processing and model training.
- Launch the interactive dashboard:
  ```sh
  streamlit run app/app.py
  
## Model Monitoring and Automation
### Model Monitoring
To monitor the model's performance over time, run the monitor_model.py script. Schedule this script to run at regular intervals using a task scheduler (e.g., cron).
  ```sh
  python scripts/monitor_model.py
```
### Automated Feature Selection
To automate feature selection, run the automated_feature_selection.py script.
  ```sh 
  python scripts/automated_feature_selection.py
  ````

### Automated Hyperparameter Tuning
To automate hyperparameter tuning, run the automated_hyperparameter_tuning.py script.
  ```sh
    python scripts/automated_hyperparameter_tuning.py
  ```
## Contributions
Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License
MIT License

## Data Collection and Preprocessing

### Dataset Source
- **Name**: Customer Personality Analysis
- **Source**: Kaggle
- **Link**: [Customer Personality Analysis]https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis/data)

### Initial Data Inspection
- Loaded the dataset and inspected the first few rows, summary statistics, and data information.

### Data Cleaning
- Handled missing values if any by forward filling.
- Removed duplicates if any.

### Output
- Saved the cleaned data in `data/processed/cleaned_data.csv`.

## Feature Engineering

### New Features Created
- **Age**: Calculated as 2024 minus the year of birth.
- **Total Children**: Sum of `Kidhome` and `Teenhome`.
- **Total Spend**: Sum of spending on different product categories (`MntWines`, `MntFruits`, `MntMeatProducts`, `MntFishProducts`, `MntSweetProducts`, `MntGoldProds`).
- **Recency Group**: Categorical feature based on the recency of the last purchase, divided into four groups.

### Updated Features
- `Age`
- `Total_Spend`
- `Total_Children`
- `Income`
- `Recency`
- `NumWebPurchases`
- `NumCatalogPurchases`
- `NumStorePurchases`
- `NumWebVisitsMonth`
- One-hot encoded `Education`
- One-hot encoded `Marital_Status`

### Preprocessing Steps
- One-hot encoding of categorical variables (`Education` and `Marital_Status`).
- Standardization of features using `StandardScaler`.
- Handling class imbalance using SMOTE.

### Output
- Saved the processed features and target variable in `data/processed/X_resampled.npy` and `data/processed/y_resampled.npy`.

## Customer Segmentation with RFM Analysis
- **RFM Analysis**: Identified high-value customers using RFM (Recency, Frequency, Monetary) scores.
- **Purpose**: Highlight high-engagement segments for CX improvements.

### Features Used
- `Age`
- `Total_Spend`
- `Total_Children`

### Clustering Method
- K-means clustering.

### Optimal Number of Clusters
- Determined using the elbow method.

### Evaluation
- Silhouette Score.

### Visualization
- PCA plot of clustered data.

### Output
- Saved the segmented data in `data/processed/segmented_data.csv`.

## Propensity Modeling

### Features Used
- `Age`
- `Total_Spend`
- `Total_Children`
- `Income`
- `Recency`
- `NumWebPurchases`
- `NumCatalogPurchases`
- `NumStorePurchases`
- `NumWebVisitsMonth`
- One-hot encoded `Education`
- One-hot encoded `Marital_Status`

### Target Variable
- `Response` (Indicates customer response to the last campaign)

### Model
- Logistic Regression with hyperparameter tuning using GridSearchCV.

### Evaluation Metrics
- Accuracy
- Precision
- Recall
- AUC-ROC

### Output
- Saved the trained model in `models/propensity_model_updated.pkl`.

## Voice of the Customer (VoC) Analysis

### Simulated Customer Feedback
- **Data**: Created a synthetic dataset of customer feedback with associated ratings.
- **Purpose**: Provides a realistic VoC dataset for sentiment analysis and CX insights.

### Sentiment Analysis
- **Sentiment Scoring**: Used TextBlob to classify feedback into positive, neutral, and negative categories.
- **Key Insights**:
  - Sentiment distribution across feedback.
  - Average rating by sentiment group to understand the relationship between satisfaction and feedback sentiment.
- **Output**: Saved in `../data/processed/feedback-with-sentiment.csv` for further analysis.

## SQL Highlights
1. **High-Value Customer Identification**: Extracts top customers for targeted engagement strategies.
2. **Sentiment Analysis by Segment**: Summarizes feedback sentiment for different customer segments.
3. **Recent Buyers with Negative Feedback**: Identifies customers at risk due to recent negative experiences.
4. **Spending Behavior Analysis**: Shows the impact of sentiment on customer spending.
5. **Campaign Response Report**: Evaluates marketing campaign effectiveness across customer segments.

## Setting Up a Local Database Connection
- To run this project and execute the SQL scripts, you need to set up a local database connection.
- **MySQL Server** installed and running locally. You can install it using Homebrew on macOS:
  ```bash
  brew install mysql
  brew services start mysql
  ```
- In `scripts/insert_data.py` set the mysql server's password as an environment variable called `DB_PASSWORD`
- Run `scripts/insert_data.py` to populate the tables with data.

### How to Run the SQL Scripts
1. **Connect to your MySQL database** using MySQL Workbench or your preferred SQL client.
2. **Execute the `create_tables.sql` script** to set up the tables.
3. **Insert data** using the Python script or directly in your SQL client.
4. **Run the `cx_queries.sql` script** to showcase advanced SQL analysis.
