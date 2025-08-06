Predictive Modeling of Drug Sensitivity Using Gene Expression Data

Methodology
The following step-by-step methodology was used to preprocess, explore, engineer features, and develop a machine learning model to predict drug sensitivity from the GDSC (Genomics of Drug Sensitivity in Cancer) dataset.

1. Data Acquisition and Initial Exploration
The dataset was imported using pandas.
It includes dose-response measurements for various cancer cell lines treated with multiple drugs.

2. Data Cleaning and Column Reduction
Unnecessary columns were removed since these did not contribute meaningful information to the predictive modeling and could introduce noise or redundancy.

3. Handling Missing Values
Categorical variables such as PUTATIVE_TARGET and TCGA_DESC contained missing values which were imputed using mode (most frequently occurring category), which is suitable for categorical features.

4. Exploratory Data Analysis (EDA)
Descriptive statistics revealed:
o A wide range in LN_IC50 values indicating diversity in drug efficacy.
o Skewness and potential outliers in AUC and Z_SCORE.
Histograms and boxplots were generated to visualize:
o Distributions of numerical variables.

5. Outlier Detection and Skewness Treatment
Outliers were identified using the Interquartile Range (IQR) method.
Skewness was treated using:
o Logarithmic transformation for RMSE.
o Cube-root transformation for LN_IC50 and AUC to compress long tails.

6. Outlier Handling with Winsorization
Winsorization was used to cap extreme values in LN_IC50 and AUC.The top and bottom 5% values were clipped to reduce the influence of outliers while retaining most of the data structure.

7. Encoding Categorical Features
Several categorical variables required transformation into numerical formats:
TCGA_DESC (cancer type) was label encoded.
SANGER_MODEL_ID and DRUG_NAME were frequency encoded—converted based on how often each category appeared in the dataset.
PUTATIVE_TARGET was mapped to a higher-level biological category (e.g., EGFR → Receptor Tyrosine Kinase), then label encoded.
These transformations converted text-based features into numerical forms suitable for model training.

8. Target Variable Creation (Drug Sensitivity Classification)
A new multi-class target variable i.e.,Sensitivity was engineered based on thresholds:
o LN_IC50 < -4.5 or AUC < 0.85 or Z_SCORE < -1.5 → Sensitive
o Values in a moderate range → Intermediate
o Otherwise → Resistant
This categorical label was then encoded numerically for model training.

9. Feature Selection
SelectKBest with ANOVA F-statistic was applied to identify the top 5 features most correlated with the target class.
These included:
o AUC
o AUC_cbrt (cube-root transformed AUC)
o LN_IC50_winsorized
o AUC_winsorized
Reducing the feature space helped avoid overfitting and improved model performance.

10. Feature Normalization
The selected numerical features were scaled using MinMaxScaler to bring them into the [0, 1] range.
Normalization ensures that models sensitive to feature magnitude (e.g., KNN, SVM) perform optimally.

11. Train-Test Split and Handling Class Imbalance
The dataset was split into:
o 80% training data
o 20% testing data
To address the class imbalance (disproportionate numbers of Sensitive, Intermediate, and Resistant samples), SMOTE (Synthetic Minority Over-sampling Technique) was applied to the training set.
o SMOTE generates synthetic samples for minority classes to create a balanced training set.

12. Model Training and Evaluation
Nine classifiers were trained and evaluated:
Baseline models: Logistic Regression, Decision Tree, Naive Bayes
Ensemble models: Random Forest, Gradient Boosting, AdaBoost, XGBoost
Others: Support Vector Machine (SVC), K-Nearest Neighbors
Each model was trained on the balanced training data and evaluated on the test set using accuracy score.

13. Final Model Selection and Saving
The Gradient Boosting Classifier outperformed others based on accuracy and consistency.
It was further tuned with:
o n_estimators=300, learning_rate=0.1, max_depth=5, subsample=0.8, min_samples_split=5
The trained model was saved using Pickle for reuse in deployment scenarios or future validation.


Conclusion
This project successfully demonstrated the use of machine learning models for predicting drug sensitivity using publicly available datasets.
