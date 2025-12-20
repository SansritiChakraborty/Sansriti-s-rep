# Zomato Restaurant Data Analysis (EDA)

## Project Overview

This project focuses on performing Exploratory Data Analysis (EDA) on a Zomato restaurant dataset to uncover insights related to restaurant ratings, pricing, online ordering behavior, and restaurant types. The objective is to clean real-world data, explore patterns, and derive meaningful business insights using Python.

This project is designed to demonstrate core Data Analyst skills, including data cleaning, data visualization, and analytical reasoning.


## Objectives

1. Understand the structure and quality of the restaurant dataset
2. Clean and preprocess messy, real-world data
3. Analyze restaurant ratings and cost distributions
4. Explore the relationship between online ordering and ratings
5. Identify trends across different restaurant categories


## Dataset Description

The dataset contains information about restaurants, including:

1. Restaurant name and address
2. Ratings and number of votes
3. Online ordering and table booking availability
4. Restaurant type and cuisine
5. Approximate cost for two people


## Data Cleaning & Preprocessing

The following steps were performed:

* Handled missing values using appropriate strategies:

1. Median imputation for numeric columns (e.g., ratings, cost)
2. Placeholder values for categorical columns (e.g., `Unknown`)
3. Converted mixed-format rating values (e.g., `4.2/5`, `NEW`) into numeric format
4. Removed or ignored columns with excessive missing values
5. Converted cost values from string to numeric format

## Exploratory Data Analysis (EDA)

### Univariate Analysis

-Distribution of restaurant ratings using histograms
-Cost distribution for two people using binned histograms
-Frequency analysis of online ordering availability

### Bivariate Analysis

-Boxplot analysis of ratings vs online ordering availability
-Heatmap showing restaurant types vs online ordering
-Comparison of cost ranges across restaurant categories


### Key Insights

-Most restaurants are rated between 3.0 and 4.5, indicating generally positive customer feedback
-Restaurants offering online ordering tend to have slightly higher median ratings
-Delivery-focused restaurants show strong adoption of online ordering
-Pubs, bars, and nightlife venues predominantly operate offline
-Mid-range cost restaurants are the most common



### Visualizations:

-Histograms (distribution analysis)
-Boxplots (comparison of ratings)
-Heatmaps (category-wise online ordering trends)

All visualizations were created using Matplotlib to clearly communicate trends and patterns.

## Conclusion

This project demonstrates the ability to work with messy real-world data, perform structured exploratory data analysis, and translate data findings into meaningful business insights. The analysis highlights how online delivery availability and restaurant type influences customer ratings and operational trends.


