# 💳 Credit Card Customer Churn Analysis

## Project Overview
This project aims to analyze and predict customer churn for credit card services. By understanding the profiles and behaviors of customers who are likely to discontinue their services, the bank can proactively reach out, deliver enhanced services, and positively influence customer retention.

## Project Scenario
A bank manager is expressing concern over the rising trend of customers discontinuing their credit card services. They seek assistance in profiling customers to predict those who are likely to leave their credit card services. This proactive approach will empower the company to reach out to these customers, deliver enhanced services, and positively influence their decisions.

## Tools and Technologies
- **Query and Database Management**: MySQL Server
- **Data Visualization**: Tableau
- **Reporting**: Google Slides

## Project Stages
## 1. **Determine Business Objectives**
## 2. **Data Exploration**
The project involves thorough exploration of customer data to uncover patterns and trends related to churn behavior. This includes analyzing demographic information, transaction history, and customer interactions with the bank's services.

### Datasets
1. **Status Data (status_db)**:
* Description: This dataset contains the status of the customers, indicating whether they are existing customers or have churned.
* Function: Helps identify and classify customers based on their current status with the bank.

2. **Marital Status Data (marital_db)**
* Description: This dataset provides information about the marital status of the customers.
* Function: Used to analyze the influence of marital status on customer churn.
  
3. **Education Data (education_db)**
* Description: This dataset contains the education levels of the customers.
* Function: Helps in understanding the relationship between educational background and churn behavior.

4. **Card Category Data (category_db)**
* Description: This dataset includes different categories of credit cards held by the customers.
* Function: Used to determine if certain card categories are more prone to customer churn.

5. **Customer Data History (customer_data_history)**
* Description: This dataset holds historical data of customers, including demographics, account information, and transaction history.
* Function: Provides comprehensive data for profiling customers, analyzing behavior, and predicting churn.


## 3. **Insight and Visualization**
### Data Analysis
1. customer_data_combined Table
* Description: A consolidated table combining necessary customer data from multiple tables.
* Purpose: Serves as the base table for further analysis and visualization.

2. Churn Analysis View
* Description: A view created for analyzing churn with customer segmentation based on age, utilization ratio, years on book, credit limit, revolving balance, open-to-buy amount, transaction amount, and transaction frequency.
* Purpose: Provides a segmented view to better understand customer churn patterns.

3. Key Metrics and Insights
1. **Percentage of Churned Customers by Status**
* Purpose: Determines the percentage of customers who have churned vs. those who are still active.
2. **Distribution of Churned Customers by Age Segment**
* Purpose: Analyzes the age distribution of churned customers to identify age-related churn patterns.
3. **Income Category Distribution Among Churned Customers by Gender**
* Purpose: Examines the relationship between income categories and gender among churned customers.
  
# Visualizations
Export the aggregate table to CSV, then build a dashboard using the data from the aggregate table in Tableau.
- **Tableau Dashboard**: [View Dashboard](#)

## 4. **Conclusions and Recommendations**
**Conclusion**:
* Younger and older customers are more likely to churn.
* Customers with lower income categories have higher churn rates.
  
**Recommendations**:
* **Targeted Customer Engagement**: Develop targeted engagement strategies for younger and older customers with personalized offers and services.
* **Financial Advisory Services**: Provide financial advisory services to lower-income customers to help them manage their finances better.
* **Loyalty Programs**: Implement loyalty programs aimed at younger and lower-income customers to increase their engagement and satisfaction.


## Acknowledgments
This project was completed as part of the Data Engineer Virtual Internship at Rakamin Academy, in collaboration with BTPN Syariah.

For more details, please refer to the [virtual internship details](https://www.rakamin.com/virtual-internship-experience/task/data-engineer-btpn-syariah/3901)

