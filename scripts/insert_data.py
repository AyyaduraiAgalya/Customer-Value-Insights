import pandas as pd
from sqlalchemy import create_engine
import os

# Get the password from the environment variable
db_password = os.getenv('DB_PASSWORD')

# Build the connection string
engine = create_engine(f'mysql+mysqlconnector://root:{db_password}@localhost/customer_insights_db')

# Load data from CSV files
customers_df = pd.read_csv('data/processed/segmented-customer-data.csv')
feedback_df = pd.read_csv('data/processed/feedback-with-sentiment.csv')

# Insert data into the customers table
customers_df.to_sql('customers', con=engine, if_exists='append', index=False)

# Insert data into the feedback table
feedback_df.to_sql('feedback', con=engine, if_exists='append', index=False)

print("Data inserted successfully!")
