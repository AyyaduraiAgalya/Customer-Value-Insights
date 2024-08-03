# CustomerValueInsights

## Overview
CustomerValueInsights is a comprehensive data science project focused on customer segmentation and propensity modeling. The project leverages machine learning techniques to gain insights into customer behavior and develop predictive models to enhance customer value and optimize business decisions.

## Project Structure
- `data/`: Contains raw and processed data files.
- `notebooks/`: Jupyter notebooks for each step of the project.
- `scripts/`: Python scripts for data processing, feature engineering, model development, and evaluation.
- `app/`: Source code for the interactive dashboard built with Streamlit/Flask.
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