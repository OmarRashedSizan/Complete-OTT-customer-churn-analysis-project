# 1. Executive Summary

## Overview

Before performing any analytical modeling, visualization, or business intelligence reporting, it is essential to evaluate the quality of the available data. Poor data quality can produce misleading insights, inaccurate business decisions, and unreliable predictive models. Therefore, the first technical phase of this project focused on conducting a comprehensive Data Profiling exercise across the entire customer churn database.

The profiling process was performed on an OTT (Over-the-Top) video streaming platform dataset consisting of three interconnected business tables:

- **db_customer** – Customer demographic and profile information
- **db_subscription** – Subscription lifecycle, pricing, revenue, and churn-related information
- **db_support** – Customer support interactions, complaint history, escalation records, and customer satisfaction (CSAT)

Together, these three datasets represent the complete customer journey—from customer acquisition to subscription management and post-sales support—allowing comprehensive churn analysis from both business and operational perspectives.

---

## Profiling Scope

The primary objective of this profiling exercise was not to perform data cleaning immediately, but to understand the overall health of the dataset and identify potential data quality issues that could impact downstream analytics.

The assessment covered the following dimensions:

- Database completeness
- Missing value analysis
- Duplicate record detection
- Domain and categorical consistency
- Numerical validation
- Date validation
- Referential integrity validation
- Business rule validation
- Overall data quality assessment

Each validation was designed to determine whether the stored business data accurately reflects real-world business operations and whether it is suitable for advanced analytics and machine learning.

---

## Dataset Summary

The profiling was conducted on three production-style business tables containing the following records:

| Table | Purpose | Records |
|--------|----------|---------:|
| db_customer | Customer demographic information | 600 |
| db_subscription | Subscription and revenue information | 600 |
| db_support | Customer support history | 648 |

The database contains a one-to-one relationship between customers and subscriptions, while support interactions follow a one-to-many relationship, allowing a customer to create multiple support tickets throughout their subscription lifecycle.

---

## Key Findings

The profiling exercise identified several realistic data quality issues commonly observed in enterprise production environments.

Major findings include:

### Data Completeness

- Missing demographic attributes such as Country, State, Gender, Interests, and Pincode.
- Missing cancellation information for active subscribers (expected business behavior).
- Small number of missing subscription attributes requiring validation.

---

### Data Consistency

Several categorical fields contain inconsistent naming conventions.

Examples include:

- Bangladesh / BD / bangladesh
- India / IND / india
- Referral / referal / Refferal / eferral
- Male / male / M / Men
- Female / F / Women
- Dhaka / Dhakaa
- Chittagong / Chattogram

These inconsistencies would negatively affect customer segmentation and reporting if left unresolved.

---

### Data Validity

Several business rule violations were detected.

Examples include:

- Negative Monthly Charges
- Unrealistically high Monthly Charges
- Invalid CSAT Scores (-5 and 120)
- Invalid Escalation Levels
- Missing Cancellation Date despite Cancellation Reason
- Mixed Complaint Categories and Priority Labels

These issues require correction before statistical analysis or predictive modeling.

---

### Referential Integrity

The database structure is well maintained.

Validation confirmed:

- No orphan subscription records
- No orphan support records
- Proper foreign-key relationships across all tables

This indicates strong structural consistency within the relational database.

---

### Duplicate Records

No duplicate customer records or duplicate subscription records were identified.

Repeated support tickets were determined to represent legitimate multiple customer interactions rather than duplicate data entries.

---

## Overall Assessment

From a structural perspective, the database demonstrates good relational integrity and a realistic business design. However, several data quality issues—including inconsistent categorical values, missing demographic information, invalid numerical values, and business rule violations—must be resolved before conducting exploratory data analysis (EDA), dashboard development, or machine learning.

Overall, the dataset is considered suitable for business analytics after systematic data cleaning and standardization.

---

## Next Phase

The findings documented in this report will directly guide the Data Cleaning phase.

Rather than applying generic cleaning techniques, each transformation will be driven by evidence collected during profiling, ensuring that all preprocessing activities remain transparent, traceable, and aligned with business requirements.

This evidence-based approach reflects industry best practices commonly followed in modern data analytics, business intelligence, and machine learning projects.

# 2. Objective

## Purpose of Data Profiling

The primary purpose of this data profiling exercise is to evaluate the overall quality, consistency, completeness, and reliability of the customer churn dataset before performing any downstream analytical activities.

In real-world business environments, data collected from multiple operational systems often contains inconsistencies, missing values, invalid records, and business rule violations. If these issues are ignored, they can significantly impact reporting accuracy, business intelligence dashboards, customer segmentation, and predictive machine learning models.

Therefore, before beginning Exploratory Data Analysis (EDA), dashboard development, or churn prediction modeling, it is essential to understand the current state of the dataset and identify all potential data quality issues.

This profiling process establishes a data-driven foundation for the remainder of the analytics project.

---

## Business Objectives

From a business perspective, this profiling exercise aims to ensure that the available data accurately represents real customer behavior and business operations.

The key business objectives are:

- Assess whether the available data is reliable enough for customer churn analysis.
- Identify data quality issues that may affect business decision-making.
- Detect inconsistencies that could produce incorrect customer segmentation.
- Validate whether customer lifecycle information follows expected business processes.
- Improve confidence in business insights generated from the data.
- Reduce the risk of inaccurate reporting caused by poor data quality.

Ultimately, the business objective is to build a trustworthy analytical dataset that enables management to make informed retention and revenue optimization decisions.

---

## Technical Objectives

From a technical perspective, this profiling exercise focuses on evaluating the structural and logical quality of the database.

The profiling includes validation of:

- Database completeness
- Missing values
- Duplicate records
- Data type consistency
- Domain validation
- Numerical value validation
- Date validation
- Referential integrity
- Business rule compliance
- Categorical value consistency

The results of these validations will be used to design a structured and reproducible data cleaning process.

---

## Analytical Objectives

From an analytical perspective, the profiling process aims to ensure that the dataset is suitable for statistical analysis, visualization, and predictive modeling.

The objectives include:

- Prepare high-quality data for Exploratory Data Analysis (EDA).
- Improve the accuracy of customer segmentation.
- Enable reliable churn pattern identification.
- Support meaningful correlation and trend analysis.
- Increase the performance and reliability of future machine learning models.
- Ensure that business insights are based on validated and trustworthy data.

A well-profiled dataset minimizes analytical bias and improves confidence in all subsequent findings.

---

## Expected Deliverables

The outcome of this profiling exercise includes:

- Comprehensive data quality assessment.
- Identification of missing and inconsistent values.
- Detection of business rule violations.
- Validation of relational integrity.
- Documentation of numerical and categorical anomalies.
- Prioritized data cleaning recommendations.
- A complete Data Profiling Report to support the next phase of the project.

These deliverables serve as the bridge between raw operational data and a clean, analysis-ready dataset.

---

## Expected Outcome

By completing this profiling phase, the project team will gain a clear understanding of the strengths and weaknesses of the dataset.

The findings will guide all future preprocessing activities, ensuring that every cleaning decision is evidence-based rather than assumption-driven.

This structured approach aligns with industry best practices followed in Data Analytics, Business Intelligence, and Machine Learning projects, where data quality assessment is considered a mandatory step before any business analysis begins.

# 3. Dataset Overview

## Overview

The **customer_churn** database has been designed to simulate a real-world Operational Data Store (ODS) for an OTT (Over-the-Top) video streaming platform. The dataset captures information across the complete customer lifecycle, beginning with customer registration, continuing through subscription management, and extending to customer support interactions.

Rather than storing all information in a single table, the database follows a **normalized relational design**, where different business processes are represented by separate tables connected through a common business key (`customerid`). This design reduces data redundancy, improves data integrity, and supports scalable analytical workflows.

The dataset contains three core business entities:

- **db_customer**
- **db_subscription**
- **db_support**

Together, these tables provide a 360-degree view of each customer, enabling comprehensive customer churn analysis from demographic, financial, behavioral, and operational perspectives.

---

## Database Statistics

| Table | Description | Records | Primary Key |
|--------|-------------|--------:|-------------|
| db_customer | Customer demographic and profile information | 600 | customerid |
| db_subscription | Subscription lifecycle, pricing, contract, and churn information | 600 | customerid |
| db_support | Customer support interactions and satisfaction records | 648 | support_id |

The database contains **1,848 total records**, representing **600 unique customers** and **648 support interactions**.

---

## Database Architecture

The database follows a relational architecture where **db_customer** acts as the master entity.

Relationship structure:

```text
               db_customer
                    │
        customerid (Primary Key)
               /               \
              /                 \
             ▼                   ▼
db_subscription          db_support
 (1 : 1 Relationship)   (1 : Many Relationship)
```

### Relationship Explanation

- Every customer has one subscription record.
- A customer may create multiple support tickets during their subscription lifecycle.
- The `customerid` column acts as the business key that connects all three tables.
- The `support_id` uniquely identifies each support interaction.

This relational design enables integrated customer analysis across multiple business functions.

---

## Dataset Granularity

Understanding the level of granularity is essential before beginning any analysis.

| Table | Granularity |
|--------|-------------|
| db_customer | One record per customer |
| db_subscription | One record per customer subscription |
| db_support | One record per support interaction |

Because support tickets are stored at the interaction level, a single customer can appear multiple times in **db_support**. This allows analysts to measure complaint frequency, escalation patterns, and customer satisfaction over time.

---

## Business Coverage

The dataset captures multiple dimensions of customer behavior, allowing cross-functional business analysis.

### Customer Dimension

The customer table stores demographic and preference information, including:

- Customer identity
- Geographic location
- Gender
- Date of birth
- Content interests

This information supports customer segmentation and demographic analysis.

---

### Subscription Dimension

The subscription table captures the financial and contractual relationship between the customer and the streaming platform.

It includes:

- Subscription start date
- Acquisition channel
- Subscription plan
- Contract type
- Monthly charges
- Customer Lifetime Value (CLTV)
- Churn score
- Cancellation information

This table forms the primary business dataset for churn analysis because it directly reflects customer revenue and retention behavior.

---

### Customer Support Dimension

The support table records every interaction between customers and the customer support team.

Information includes:

- Complaint date
- Escalation status
- Customer Satisfaction Score (CSAT)
- Complaint category
- Customer comments

Support interactions provide valuable operational signals that can help identify customers who are at risk of churning.

---

## Analytical Perspective

From an analytical perspective, the three tables complement each other to provide a complete view of the customer journey.

- **db_customer** answers **"Who is the customer?"**
- **db_subscription** answers **"How does the customer generate revenue?"**
- **db_support** answers **"What problems has the customer experienced?"**

By integrating these datasets through the `customerid`, analysts can examine how customer demographics, subscription behavior, and service experiences collectively influence churn.

This integrated view enables deeper analysis, such as:

- Which customer segments have the highest churn rate?
- Do Premium subscribers generate higher CLTV than Basic subscribers?
- Does low CSAT increase churn probability?
- Which complaint categories are most associated with customer cancellations?
- Which acquisition channels deliver the highest long-term customer value?

---

## Importance for Business Analytics

The structure of this dataset makes it suitable for a wide range of analytical use cases, including:

- Customer Churn Analysis
- Customer Segmentation
- Revenue Analysis
- Customer Lifetime Value (CLTV) Analysis
- Support Performance Analysis
- Customer Satisfaction (CSAT) Analysis
- Acquisition Channel Performance
- Retention Strategy Development
- Executive KPI Reporting
- Predictive Machine Learning Models

Overall, the dataset provides a realistic business environment for performing end-to-end data analytics, beginning with data profiling and cleaning, progressing through exploratory analysis and visualization, and ultimately supporting business decision-making and predictive churn modeling.

# 4. Profiling Methodology

## 4.1 Introduction

Data profiling is the systematic process of examining a dataset to understand its structure, quality, completeness, consistency, and overall fitness for business analytics.

Before performing Exploratory Data Analysis (EDA), dashboard development, statistical analysis, or machine learning, it is essential to identify data quality issues that may introduce bias or lead to incorrect business decisions.

For this project, a structured data profiling methodology was followed to evaluate the overall health of the **customer_churn** database. The objective was to identify both technical and business-related data quality issues while maintaining complete transparency throughout the analytical process.

---

# 4.2 Profiling Approach

The profiling process followed an industry-standard workflow consisting of multiple validation stages.

```
Business Understanding
        │
        ▼
Database Understanding
        │
        ▼
Schema Validation
        │
        ▼
Data Profiling
        │
        ▼
Data Quality Assessment
        │
        ▼
Issue Identification
        │
        ▼
Data Cleaning Plan
        │
        ▼
Exploratory Data Analysis (EDA)
```

Instead of immediately cleaning the data, each validation was first documented to ensure that every transformation performed during the cleaning phase would be supported by objective evidence.

This approach aligns with modern Data Governance and Data Quality Management practices.

---

# 4.3 Profiling Environment

The profiling exercise was conducted using the following technology stack.

| Component | Tool |
|------------|------|
| Database | MySQL 8 |
| Query Language | SQL |
| Database IDE | MySQL Workbench |
| Documentation | Markdown |
| Version Control | Git & GitHub |

SQL was selected because it allows efficient validation of large relational datasets while preserving business logic directly within the database.

---

# 4.4 Data Quality Dimensions

The dataset was evaluated across several internationally recognized data quality dimensions.

| Data Quality Dimension | Purpose |
|------------------------|---------|
| Completeness | Detect missing values |
| Uniqueness | Identify duplicate records |
| Consistency | Detect inconsistent categorical values |
| Validity | Verify whether values fall within expected ranges |
| Accuracy | Validate business meaning of stored data |
| Integrity | Verify table relationships |
| Timeliness | Validate chronological correctness of dates |
| Business Compliance | Ensure records follow business rules |

Each dimension focuses on a different aspect of data quality, providing a comprehensive understanding of the dataset before analysis begins.

---

# 4.5 Profiling Categories

The profiling process was divided into six major categories.

## 1. Structural Profiling

Structural profiling focused on understanding the overall database architecture.

Activities included:

- Table count
- Row count
- Column count
- Primary keys
- Foreign keys
- Data types
- Relationship validation

---

## 2. Completeness Profiling

Completeness profiling measured the availability of information within each table.

Checks included:

- Missing values
- NULL values
- Blank strings
- Optional vs mandatory fields

The objective was to determine whether sufficient information exists for meaningful business analysis.

---

## 3. Consistency Profiling

Consistency profiling examined whether similar business values were stored using multiple formats.

Examples include:

- Bangladesh vs BD vs bangladesh
- Male vs M vs Men
- Female vs F vs Women
- Referral vs referal vs Refferal
- Dhaka vs Dhakaa

Although these values represent the same business entity, inconsistent storage negatively impacts reporting accuracy.

---

## 4. Validity Profiling

Validity profiling evaluated whether stored values satisfy predefined business constraints.

Examples include:

- Negative Monthly Charges
- Invalid CSAT Scores
- Invalid Escalation Levels
- Negative Churn Score
- Impossible numerical values

This validation ensures that analytical models are built using realistic business data.

---

## 5. Referential Integrity Profiling

Relational integrity was verified across all three tables.

Validation included:

- Subscription without Customer
- Support Ticket without Customer
- Broken Relationships
- Orphan Records

Maintaining referential integrity is essential for accurate customer journey analysis.

---

## 6. Business Rule Validation

Business rules describe how real-world business operations should behave.

The dataset was validated against several predefined business rules, including:

- Cancellation Date cannot occur before Subscription Start Date.
- Renewal Date cannot occur before Subscription Start Date.
- Monthly Charges must be greater than zero.
- CSAT Score must remain within the accepted rating scale.
- Escalation values must follow the organization's defined levels.
- Cancellation Reason should only exist when a Cancellation Date is available.

These validations ensure that the data reflects realistic business processes rather than merely satisfying database constraints.

---

# 4.6 SQL-Based Validation Strategy

All profiling activities were performed using SQL queries directly within the relational database.

SQL validation techniques included:

- Aggregate Functions
- GROUP BY Analysis
- COUNT()
- COUNT(DISTINCT)
- CASE WHEN
- LEFT JOIN
- INNER JOIN
- HAVING
- Common Table Expressions (CTEs)
- Date Functions
- Conditional Logic

Executing validations inside the database improves performance, reduces unnecessary data movement, and enables reproducible data quality assessments.

---

# 4.7 Documentation Strategy

Every profiling result was documented before any cleaning activities were performed.

Each issue was classified into one of the following categories:

- Missing Data
- Duplicate Records
- Domain Inconsistency
- Invalid Values
- Referential Integrity Issues
- Business Rule Violations

For every identified issue, the following information was recorded:

- Description of the issue
- Business impact
- Affected table
- Validation SQL
- Number of affected records
- Recommended cleaning strategy

This documentation ensures that all future preprocessing steps remain transparent, auditable, and reproducible.

---

# 4.8 Expected Outcome

By following this structured profiling methodology, the project establishes a reliable understanding of the dataset before any analytical work begins.

The outputs of this phase serve as the foundation for:

- Data Cleaning
- Feature Engineering
- Exploratory Data Analysis (EDA)
- Dashboard Development
- Business Intelligence Reporting
- Customer Churn Prediction
- Executive Decision Support

Following a documented profiling methodology minimizes analytical errors and increases confidence in every insight generated during later phases of the project.

# 5. Data Quality Assessment

## Overview

The objective of this assessment is to evaluate the overall quality of the dataset across multiple data quality dimensions before proceeding to data cleaning and exploratory analysis.

Each assessment focuses on a specific aspect of data quality, including completeness, uniqueness, consistency, validity, referential integrity, and compliance with predefined business rules.

The findings presented in this section are based on SQL validation queries executed directly against the MySQL database. These validations provide quantitative evidence of the current condition of the dataset and help determine the cleaning strategy required before analytical modeling.

The assessment follows internationally recognized data quality dimensions commonly used in Business Intelligence, Data Analytics, Data Engineering, and Machine Learning projects.

The six dimensions evaluated are:

- Completeness
- Uniqueness
- Consistency
- Validity
- Integrity
- Business Rule Validation

Each dimension is discussed separately in the following sections.

# 5.1 Completeness Assessment

## Overview

Completeness is one of the fundamental dimensions of data quality. It measures whether all required information is present within the dataset to support accurate business analysis and decision-making.

Incomplete data can lead to biased analytical results, incorrect customer segmentation, inaccurate KPI calculations, and unreliable machine learning models. Therefore, evaluating data completeness is an essential step before data cleaning and exploratory analysis.

For this project, completeness was assessed by examining missing (`NULL`) values and blank (`''`) values across all three business tables.

---

## Assessment Methodology

The completeness assessment was performed using SQL aggregation functions (`COUNT`, `SUM`, and `CASE WHEN`) to identify missing information for every column.

The assessment considered two types of missing data:

- **NULL values**, representing information that was never recorded.
- **Blank values (`''`)**, representing records where the field exists but no meaningful value was stored.

Both scenarios were treated as missing information because neither provides analytical value.

---

# Table-Level Assessment

## 5.1.1 db_customer

The **db_customer** table contains **600 customer records**.

Most demographic fields are well populated; however, several important customer attributes contain missing values.

| Column | Missing Records | Missing % | Business Impact |
|---------|----------------:|----------:|-----------------|
| Country | 45 | 7.50% | Limits geographic segmentation |
| State | 41 | 6.83% | Reduces regional analysis accuracy |
| Gender | 30 | 5.00% | Impacts demographic reporting |
| Interests | 39 | 6.50% | Weakens content preference analysis |
| Pincode | 17 | 2.83% | Limits location-level analysis |

No missing values were identified in:

- Customer ID
- Customer Name
- Date of Birth

These mandatory business attributes remain complete.

### Business Interpretation

Although the percentage of missing demographic information is relatively low, these fields are frequently used for customer segmentation, marketing campaigns, and regional performance analysis.

For example:

- Missing **Country** affects international customer reporting.
- Missing **Gender** reduces demographic segmentation accuracy.
- Missing **Interests** limits recommendation and personalization analysis.

---

## 5.1.2 db_subscription

The **db_subscription** table contains **600 subscription records**.

Most operational fields are complete because they originate from transactional systems.

The assessment identified only a few missing values.

| Column | Missing Records | Missing % | Business Interpretation |
|---------|----------------:|----------:|-------------------------|
| Subscription Type | 1 | 0.17% | Acquisition channel unknown |
| Cancellation Date | Expected | N/A | Active customers have not cancelled |
| Cancellation Reason | Expected | N/A | Active subscriptions have no cancellation reason |

### Business Interpretation

The missing **Subscription Type** represents a minor data quality issue and should be reviewed during cleaning.

The missing values found in **Cancellation Date** and **Cancellation Reason** are considered **business-valid** rather than data quality problems. Customers with active subscriptions are expected to have no cancellation information.

Therefore, these values should **not** be imputed or removed during preprocessing.

---

## 5.1.3 db_support

The **db_support** table contains **648 support records**.

Most mandatory support attributes are complete.

However, the assessment identified missing values in customer comments.

| Column | Missing Records | Missing % | Business Interpretation |
|---------|----------------:|----------:|-------------------------|
| Comment | 32 | 4.94% | Customer feedback unavailable |

All remaining support attributes—including:

- Support ID
- Customer ID
- Complaint Date
- Escalation
- CSAT Score
- Complaint Category

were populated for all records.

### Business Interpretation

Missing comments reduce the ability to perform qualitative analysis such as:

- Sentiment Analysis
- Topic Modeling
- Complaint Theme Identification
- Customer Voice Analysis

However, because structured fields remain available, these missing comments have only a moderate impact on overall business analysis.

---

# Overall Completeness Assessment

The completeness assessment indicates that the dataset is largely complete.

Most missing values are concentrated within optional demographic attributes rather than critical transactional fields.

Key observations include:

- Core business identifiers are fully populated.
- Subscription records are nearly complete.
- Support records maintain high operational completeness.
- Missing demographic attributes require standard handling during data cleaning.
- Missing cancellation information is business-valid and should be preserved.

---

## Business Impact

From a business perspective, the identified missing values are unlikely to affect revenue calculations or churn identification directly.

However, they may reduce the quality of:

- Customer segmentation
- Geographic analysis
- Marketing performance analysis
- Personalization strategies
- Customer behavior analysis

Addressing these issues during the cleaning phase will improve reporting accuracy and analytical confidence.

---

## Recommendation

Based on the assessment, the following actions are recommended:

- Standardize missing representations (`NULL` and blank values).
- Preserve business-valid missing values such as cancellation information for active customers.
- Impute demographic attributes only where appropriate and justifiable.
- Retain missing customer comments rather than generating artificial text.
- Document all preprocessing decisions to ensure transparency and reproducibility.

Overall, the dataset demonstrates a **high level of completeness**, with only minor missing-value issues that can be addressed through standard data preparation techniques.

# 5.2 Uniqueness Assessment

## Overview

Uniqueness is a critical data quality dimension that ensures each business entity is represented only once within the dataset unless multiple records are expected as part of the business process.

Duplicate records can lead to inaccurate reporting, inflated KPIs, incorrect revenue calculations, misleading customer counts, and biased analytical results. Therefore, validating record uniqueness is an essential step before performing any business analysis.

For this project, uniqueness was assessed by identifying duplicate records based on primary keys and business keys across all three tables.

---

## Assessment Methodology

The uniqueness assessment was performed using SQL aggregation techniques, including:

- `COUNT(*)`
- `COUNT(DISTINCT ...)`
- `GROUP BY`
- `HAVING COUNT(*) > 1`

Each table was evaluated based on its business grain to determine whether repeated records represented true duplicates or legitimate business events.

---

# Table-Level Assessment

## 5.2.1 db_customer

The **db_customer** table contains **600 customer records**, where each record represents a unique customer.

The primary key (`customerid`) was validated for uniqueness.

### Result

| Validation | Result |
|------------|--------|
| Duplicate Customer ID | Not Found |
| Duplicate Customer Records | Not Found |

### Business Interpretation

Each customer appears exactly once in the customer master table, indicating that the customer dimension maintains strong entity integrity.

This ensures accurate customer counting, demographic analysis, and customer segmentation.

---

## 5.2.2 db_subscription

The **db_subscription** table contains **600 subscription records**, representing one subscription record for each customer.

The uniqueness of `customerid` was validated.

### Result

| Validation | Result |
|------------|--------|
| Duplicate Subscription Records | Not Found |
| Duplicate Customer Subscription | Not Found |

### Business Interpretation

The subscription table follows the expected one-to-one relationship with the customer table.

Each customer has a single subscription record, ensuring reliable revenue calculations, contract analysis, and churn measurement.

---

## 5.2.3 db_support

The **db_support** table contains **648 support records**.

Unlike the previous two tables, this table follows a **one-to-many relationship**, where a single customer may contact customer support multiple times throughout their subscription lifecycle.

### Result

| Validation | Result |
|------------|--------|
| Duplicate Support ID | Not Found |
| Multiple Complaints by Same Customer | Expected Business Behavior |

### Business Interpretation

Several customers appear multiple times within the support table.

However, these records **do not represent duplicate data**.

Instead, they reflect legitimate customer interactions such as:

- Multiple complaints regarding the same issue
- Follow-up support requests
- Escalated cases
- Recurring service problems
- Independent support tickets raised on different dates

Examples observed during profiling include customers such as **CUST-0120**, **CUST-0600**, **CUST-0555**, and others who generated multiple support interactions over time.

These repeated records provide valuable business information rather than indicating poor data quality.

---

# Overall Uniqueness Assessment

The uniqueness assessment confirms that the database maintains strong entity integrity across all core business tables.

Key observations include:

- No duplicate customer records were identified.
- No duplicate subscription records were identified.
- No duplicate primary keys were detected.
- Repeated support records represent legitimate customer interactions rather than duplicate entries.

---

## Business Impact

Maintaining unique customer and subscription records is essential for accurate business reporting.

This ensures:

- Correct customer counts
- Accurate churn rate calculations
- Reliable revenue reporting
- Trustworthy Customer Lifetime Value (CLTV) analysis
- Consistent customer segmentation
- Accurate dashboard metrics

Additionally, preserving multiple support interactions enables analysts to evaluate complaint frequency, escalation trends, repeat issues, and customer satisfaction over time.

---

## Recommendation

Based on the assessment, no duplicate records require removal.

The following practices should be maintained during the data cleaning phase:

- Preserve unique customer records.
- Preserve the one-to-one relationship between customers and subscriptions.
- Retain all valid support interactions.
- Do not remove repeated support records unless they are confirmed to be exact duplicates.

Overall, the dataset demonstrates an excellent level of uniqueness and entity integrity, providing a reliable foundation for subsequent analytical tasks.

# 5.3 Consistency Assessment

## Overview

Consistency refers to the degree to which data values are represented uniformly across the dataset. Even when two values represent the same real-world entity, storing them in different formats creates inconsistency and reduces the reliability of business reporting.

Unlike missing values or invalid data, inconsistent values are often technically correct but semantically identical. If left unresolved, they can fragment business metrics, produce misleading reports, and reduce confidence in analytical outcomes.

For this assessment, categorical attributes from all three tables were evaluated to identify inconsistent naming conventions, abbreviations, spelling variations, and capitalization differences.

---

## Assessment Methodology

Consistency was assessed by profiling the distinct values of each categorical column using SQL queries such as:

- `SELECT DISTINCT`
- `GROUP BY`
- `COUNT(*)`
- Frequency distribution analysis

The objective was to determine whether identical business entities were stored using multiple representations.

---

# Table-Level Assessment

## 5.3.1 Country

The **Country** field exhibits multiple representations for the same country.

| Stored Values | Standard Value |
|---------------|----------------|
| Bangladesh | Bangladesh |
| bangladesh | Bangladesh |
| BD | Bangladesh |
| India | India |
| india | India |
| IND | India |
| Nepal | Nepal |
| nepal | Nepal |
| NP | Nepal |

### Business Impact

Without standardization:

- Bangladesh customers appear as three separate groups.
- Country-level dashboards become inaccurate.
- Geographic segmentation becomes unreliable.
- Market share calculations become misleading.

---

## 5.3.2 State

The **State** field contains spelling variations.

Examples include:

| Stored Values | Standard Value |
|---------------|----------------|
| Dhaka | Dhaka |
| Dhakaa | Dhaka |
| Chittagong | Chattogram *(or keep Chittagong if business standard uses it)* |
| Chattogram | Chattogram |

### Business Impact

Regional performance reports become fragmented.

For example:

Instead of reporting

> Dhaka = 64 Customers

the dashboard reports

> Dhaka = 49

> Dhakaa = 15

This creates incorrect regional insights.

---

## 5.3.3 Gender

Several representations exist for customer gender.

| Stored Values | Standard Value |
|---------------|----------------|
| Male | Male |
| male | Male |
| M | Male |
| Men | Male |
| Female | Female |
| F | Female |
| Women | Female |
| Unknown | Unknown |

### Business Impact

Gender-based reporting becomes inaccurate.

Marketing teams may incorrectly estimate:

- Male/Female ratio
- Target audience
- Campaign performance
- Customer demographics

---

## 5.3.4 Subscription Type

The acquisition channel contains multiple spelling variations.

Examples include:

| Stored Values | Standard Value |
|---------------|----------------|
| Referral | Referral |
| referal | Referral |
| Refferal | Referral |
| eferral | Referral |
| Organic | Organic |
| Paid | Paid |

### Business Impact

Customer acquisition analysis becomes unreliable.

Instead of one acquisition channel named **Referral**, reports display several independent categories.

This affects:

- Marketing ROI
- Channel Performance
- Customer Acquisition Cost (CAC)
- Conversion Analysis

---

## 5.3.5 Complaint Category

The support table contains mixed business concepts within the complaint category.

Examples include:

- Streaming
- Billing
- Login
- Technical
- Account
- Payment
- Refund

Alongside these operational categories, priority labels were also found:

- Critical
- High
- Medium
- Low

### Business Impact

Issue categories and priority levels represent different business dimensions.

Mixing them within a single column makes it impossible to accurately answer questions such as:

- Which complaint type is most common?
- Which issue generates the lowest CSAT?
- Which complaint category contributes most to churn?

This inconsistency requires restructuring during the cleaning phase.

---

# Overall Assessment

The consistency assessment identified several categorical inconsistencies across the dataset.

The majority of issues are caused by:

- Different capitalization
- Abbreviations
- Typographical errors
- Alternative spellings
- Mixed business concepts

These inconsistencies are common in operational databases where information is entered manually or collected from multiple systems.

---

## Business Impact

Although these values are not technically invalid, they significantly affect analytical accuracy.

Potential consequences include:

- Incorrect customer segmentation
- Fragmented dashboards
- Misleading regional analysis
- Inaccurate acquisition channel reporting
- Reduced data quality for machine learning models
- Lower confidence in executive reports

Without standardization, identical business entities would be treated as different categories, leading to distorted KPIs and business insights.

---

## Recommendation

The following standardization activities are recommended during the data cleaning phase:

- Convert all text values to a consistent case (e.g., Proper Case or Title Case).
- Replace abbreviations with official business names.
- Correct spelling variations.
- Consolidate synonymous categorical values.
- Separate complaint categories from priority labels into different business attributes where appropriate.
- Maintain a master reference list for all categorical values to ensure future consistency.

After standardization, each business entity should have a single, authoritative representation across the database.

Overall, the dataset demonstrates **moderate consistency issues** that are typical of real-world operational systems. These issues are fully addressable through systematic data standardization and do not compromise the overall usability of the dataset.

# 5.4 Validity Assessment

## Overview

Validity refers to whether data values conform to predefined business rules, domain constraints, and acceptable value ranges.

A value may exist within a database and satisfy the data type requirements, yet still be considered invalid from a business perspective. For example, a negative subscription charge or a customer satisfaction score greater than the maximum allowed rating is technically stored in the database but does not represent a realistic business event.

The objective of this assessment is to identify values that violate expected business logic and may negatively impact analytical accuracy.

---

## Assessment Methodology

The validity assessment was performed using SQL validation queries that compared stored values against predefined business rules and acceptable domains.

The validation covered:

- Numerical value validation
- Rating validation
- Domain validation
- Business constraint validation
- Outlier detection

The assessment focused primarily on the **db_subscription** and **db_support** tables, where numerical and operational attributes have defined business limits.

---

# Table-Level Assessment

## 5.4.1 Monthly Charges Validation

Monthly subscription charges represent the recurring revenue generated from each customer.

According to the business model, subscription charges must always be greater than zero and fall within a realistic pricing range.

### Profiling Findings

The following anomalies were identified:

| Validation Issue | Observation |
|------------------|-------------|
| Zero Monthly Charge | 1 Record |
| Negative Monthly Charge | 1 Record |
| Extremely High Monthly Charge | 1 Record (999.00) |

Examples identified include:

- Monthly Charge = **0.00**
- Monthly Charge = **-10.00**
- Monthly Charge = **999.00**

### Business Impact

These values can significantly distort:

- Average Revenue Per User (ARPU)
- Monthly Recurring Revenue (MRR)
- Revenue forecasting
- Customer Lifetime Value (CLTV)
- Profitability analysis

Negative or unrealistic subscription prices do not reflect actual business transactions and must be corrected before financial analysis.

---

## 5.4.2 Customer Satisfaction (CSAT) Validation

Customer Satisfaction Score (CSAT) is collected using a standard rating scale.

According to the business rules, valid CSAT values should range from **1 to 5**.

### Profiling Findings

Several invalid scores were detected, including:

- **-5**
- **0**
- **120**

These values fall outside the acceptable business range.

### Business Impact

Invalid CSAT values can produce misleading conclusions regarding:

- Customer experience
- Support performance
- Customer retention
- Churn prediction
- Service quality reporting

Because CSAT is frequently used as an indicator of customer loyalty, invalid ratings can bias analytical models and executive dashboards.

---

## 5.4.3 Escalation Validation

The **Escalation** field indicates whether a customer issue required escalation beyond the first level of support.

According to the documented business rules:

- **0 = Resolved at First-Level Support**
- **1 = Escalated to Higher-Level Support**

### Profiling Findings

The assessment identified several invalid values, including:

- 2
- 3
- 4
- Blank values

These values fall outside the defined business domain.

### Business Impact

Invalid escalation values reduce the reliability of:

- Support performance analysis
- Escalation rate calculation
- Operational KPI reporting
- Customer service efficiency measurement

If not corrected, these records may overstate or understate the actual escalation rate.

---

## 5.4.4 Churn Score Validation

The Churn Score estimates the likelihood that a customer will cancel their subscription.

Based on the business definition, the acceptable range is **0 to 100**.

### Profiling Findings

No invalid Churn Score values were identified.

All records fall within the expected business range.

### Business Impact

Since the Churn Score is valid across all subscription records, it can be confidently used for:

- Customer risk segmentation
- Churn analysis
- Predictive modeling
- Retention strategy development

---

## Overall Validity Assessment

The validity assessment identified several business rule violations within numerical and operational fields.

Key observations include:

- Invalid Monthly Charges
- Invalid CSAT Scores
- Invalid Escalation Values

No validity issues were detected for:

- Customer ID
- Subscription Dates
- Churn Score
- Primary Key Structure

Most identified issues appear to have been intentionally introduced to simulate realistic production data quality problems.

---

## Business Impact

If these invalid values remain uncorrected, they may lead to:

- Incorrect revenue calculations
- Misleading customer satisfaction metrics
- Inaccurate support performance reporting
- Biased churn prediction models
- Reduced confidence in executive dashboards

Although the number of affected records is relatively small, their impact on aggregated metrics can be significant.

---

## Recommendation

The following corrective actions are recommended:

- Replace or investigate negative and zero Monthly Charges.
- Review and correct unrealistic pricing values.
- Restrict CSAT Scores to the valid range (1–5).
- Standardize Escalation values according to the approved business definition.
- Apply domain validation rules during data entry to prevent future inconsistencies.
- Introduce automated database constraints and validation checks to improve data quality.

After applying these corrections, the dataset will provide a more accurate representation of customer behavior and support more reliable business analysis.

Overall, the dataset demonstrates **good validity**, with a limited number of business rule violations that can be resolved through targeted data cleaning and validation procedures.

# 5.5 Integrity Assessment

## Overview

Integrity refers to the accuracy and consistency of relationships between tables within a relational database. It ensures that records remain logically connected and that no orphan records exist across related tables.

In analytical projects, maintaining referential integrity is essential because business insights often rely on combining information from multiple tables. If relationships are broken, customer-level analysis, revenue calculations, churn measurement, and dashboard reporting become unreliable.

For this project, integrity validation focused on verifying the relationships between the three core business tables:

- **db_customer**
- **db_subscription**
- **db_support**

---

## Assessment Methodology

Referential integrity was evaluated using SQL joins and validation queries.

The assessment included:

- Foreign Key validation
- Orphan record detection
- Parent-child relationship verification
- Primary Key consistency
- Cross-table relationship validation

The objective was to ensure that every subscription and support record belongs to a valid customer.

---

# Relationship Validation

## 5.5.1 Customer → Subscription Relationship

Each customer should have a corresponding subscription record.

Relationship:

```
db_customer (1)
        │
        │
        └──────────────► db_subscription (1)
```

### Profiling Result

| Validation | Result |
|------------|--------|
| Subscription Without Customer | 0 |
| Orphan Subscription Records | Not Found |

### Business Interpretation

Every subscription record is linked to a valid customer.

This confirms that subscription revenue, contract information, and churn metrics can be accurately associated with individual customers.

---

## 5.5.2 Customer → Support Relationship

A customer may contact customer support multiple times throughout their subscription lifecycle.

Relationship:

```
db_customer (1)
        │
        │
        └──────────────► db_support (Many)
```

### Profiling Result

| Validation | Result |
|------------|--------|
| Support Record Without Customer | 0 |
| Orphan Support Records | Not Found |

### Business Interpretation

Every support interaction belongs to an existing customer.

This enables analysts to connect customer complaints, CSAT scores, and escalation history with subscription behavior and churn outcomes.

---

## 5.5.3 Primary Key Integrity

Primary keys uniquely identify each business entity and prevent duplicate records.

### Validation Summary

| Table | Primary Key | Status |
|--------|-------------|--------|
| db_customer | customerid | Valid |
| db_subscription | customerid | Valid |
| db_support | support_id | Valid |

No violations of primary key integrity were identified during profiling.

---

## 5.5.4 Cross-Table Consistency

The profiling process confirmed that customer identifiers are consistently used across all related tables.

The following business relationships remain intact:

- Customer demographic information links correctly with subscription records.
- Subscription information links correctly with customer support history.
- Support interactions can be traced back to individual customers.
- Customer-level analytics can be performed without missing relationships.

This confirms that the database structure supports integrated business analysis.

---

# Overall Integrity Assessment

The integrity assessment indicates that the relational structure of the database is well maintained.

Key observations include:

- No orphan subscription records were identified.
- No orphan support records were identified.
- All primary keys remain valid.
- Relationships between tables are preserved.
- Customer-level analysis can be performed confidently across all datasets.

Although several data quality issues were identified in previous assessments (missing values, inconsistent categories, and invalid business values), these issues do **not** compromise the relational integrity of the database.

---

## Business Impact

Maintaining referential integrity provides a reliable foundation for business analytics.

Because relationships between tables remain intact, analysts can confidently perform:

- Customer Journey Analysis
- Customer Churn Analysis
- Customer Lifetime Value (CLTV) Analysis
- Customer Support Performance Analysis
- Revenue Analysis
- Customer Segmentation
- Executive Dashboard Reporting

Without strong referential integrity, these analyses could produce incomplete or misleading results.

---

## Recommendation

The database currently demonstrates excellent relational integrity.

To maintain this quality in future data loads, the following practices are recommended:

- Enforce foreign key constraints at the database level.
- Validate customer identifiers before inserting subscription or support records.
- Prevent orphan records through automated ETL validation.
- Periodically monitor referential integrity as part of the data quality pipeline.
- Include integrity checks in routine data profiling and quality assurance processes.

Overall, the database demonstrates **excellent referential integrity**, providing a strong and reliable foundation for downstream analytics, business intelligence, and predictive modeling.

# 5.6 Business Rule Validation

## Overview

Business Rule Validation verifies whether the dataset complies with the business logic and operational policies defined by the organization.

Unlike structural validation, which focuses on data types and formats, business rule validation ensures that records accurately represent real-world business processes.

For this OTT Customer Churn Analytics project, each rule was derived from the Business Requirements Document (BRD) and validated using SQL queries.

---

## Validation Methodology

Business rules were validated by comparing related fields across multiple tables and checking whether operational events occurred in a logical sequence.

The validation covered:

- Customer lifecycle events
- Subscription lifecycle
- Support process
- Financial rules
- Customer satisfaction rules
- Churn-related business constraints

---

# Rule 1 – Cancellation Date Must Not Be Earlier Than Subscription Start Date

### Business Rule

A customer cannot cancel a subscription before the subscription has started.

### Profiling Result

| Validation | Result |
|------------|--------|
| Violations Found | **0** |

### Assessment

No violations were identified.

All cancellation dates occur after the subscription start date, indicating that the subscription lifecycle follows the expected business process.

### Business Impact

This confirms that churn calculations based on cancellation dates can be trusted.

---

# Rule 2 – Renewal Date Must Be On or After Subscription Start Date

### Business Rule

A subscription must be renewed after it has been activated.

### Profiling Result

| Validation | Result |
|------------|--------|
| Violations Found | **0** |

### Assessment

No records violate this rule.

The subscription timeline is logically consistent across the dataset.

### Business Impact

Renewal-based retention analysis can be performed with confidence.

---

# Rule 3 – Complaint Date Should Occur After Subscription Start Date

### Business Rule

Customers are expected to contact support only after becoming active subscribers.

### Profiling Result

Multiple records were identified where the complaint date occurred before the recorded subscription start date.

### Assessment

This rule contains violations.

Possible explanations include:

- Historical support records migrated from another system.
- Incorrect subscription dates.
- Incorrect complaint timestamps.
- Data migration or ETL issues.

### Business Impact

If left unresolved, these records may distort:

- Customer journey analysis
- First-contact analysis
- Early churn behaviour
- Support lifecycle reporting

### Recommendation

Review these records with business stakeholders to determine whether the subscription date or complaint date is incorrect before performing behavioral analysis.

---

# Rule 4 – Every Subscription Must Belong to an Existing Customer

### Business Rule

Every subscription record must reference a valid customer.

### Profiling Result

| Validation | Result |
|------------|--------|
| Orphan Subscription Records | **0** |

### Assessment

All subscription records successfully reference an existing customer.

### Business Impact

Customer-level subscription analysis can be performed without integrity concerns.

---

# Rule 5 – Every Support Record Must Belong to an Existing Customer

### Business Rule

Every customer support interaction must belong to a valid customer.

### Profiling Result

| Validation | Result |
|------------|--------|
| Orphan Support Records | **0** |

### Assessment

No orphan support records were identified.

### Business Impact

Support behaviour can be linked directly to customer churn and satisfaction.

---

# Rule 6 – CSAT Score Must Be Between 1 and 5

### Business Rule

Customer Satisfaction Score follows a five-point rating scale.

Valid values:

- 1
- 2
- 3
- 4
- 5

### Profiling Result

Invalid values identified include:

- **-5**
- **0**
- **120**

### Assessment

Several records violate the defined business rule.

### Business Impact

These values would bias:

- Average CSAT
- Customer Experience KPIs
- Support Performance
- Churn Prediction Models

### Recommendation

Replace invalid scores after verification or treat them as missing values during analysis.

---

# Rule 7 – Escalation Status Must Contain Only 0 or 1

### Business Rule

Escalation represents whether a ticket required higher-level support.

Allowed values:

- 0 = Not Escalated
- 1 = Escalated

### Profiling Result

Invalid values identified include:

- 2
- 3
- 4
- Blank values

### Assessment

Several records violate the approved escalation policy.

### Business Impact

Incorrect escalation values will affect:

- Escalation Rate
- Support Efficiency
- SLA Reporting
- Customer Service KPIs

### Recommendation

Map invalid values to approved business categories after consultation with the Support team.

---

# Rule 8 – Monthly Charges Must Be Greater Than Zero

### Business Rule

Every active subscription should generate positive recurring revenue.

### Profiling Result

Invalid values identified include:

- 0.00
- -10.00

An unusually high value (**999.00**) was also observed and should be reviewed.

### Assessment

A small number of records violate the pricing policy.

### Business Impact

These records may distort:

- Monthly Revenue
- ARPU
- CLTV
- Financial Forecasting

### Recommendation

Validate pricing against the official product catalog before performing financial analysis.

---

# Rule 9 – Cancellation Reason Requires a Cancellation Date

### Business Rule

If a cancellation reason exists, a cancellation date must also exist.

### Profiling Result

One record was identified where a cancellation reason was present but the cancellation date was missing.

### Assessment

This represents an incomplete cancellation event.

### Business Impact

Such records can lead to incorrect churn classification and inaccurate retention metrics.

### Recommendation

Verify the record with operational teams and populate the missing cancellation date if applicable.

---

# Rule 10 – Churn Score Must Be Within the Defined Business Range

### Business Rule

The Churn Score should remain within the approved business range (0–100).

### Profiling Result

| Validation | Result |
|------------|--------|
| Violations Found | **0** |

### Assessment

No invalid churn scores were identified.

### Business Impact

The Churn Score is suitable for customer risk segmentation and predictive analytics.

---

# Overall Business Rule Assessment

The validation confirms that the dataset satisfies the majority of the defined business rules.

### Summary of Findings

| Business Rule | Status |
|---------------|--------|
| Cancellation After Subscription | ✅ Passed |
| Renewal After Subscription | ✅ Passed |
| Complaint After Subscription | ⚠️ Violations Found |
| Subscription Linked to Customer | ✅ Passed |
| Support Linked to Customer | ✅ Passed |
| Valid CSAT Score | ⚠️ Violations Found |
| Valid Escalation Value | ⚠️ Violations Found |
| Positive Monthly Charges | ⚠️ Violations Found |
| Cancellation Reason Requires Cancellation Date | ⚠️ Violation Found |
| Valid Churn Score | ✅ Passed |

---

## Conclusion

The business rule validation demonstrates that the overall dataset is structurally reliable and suitable for customer churn analysis.

Most identified issues are isolated data quality problems rather than systemic database failures. These issues can be resolved during the data cleaning phase through business-approved transformation rules.

Once the recommended corrections are applied, the dataset will provide a robust and trustworthy foundation for exploratory analysis, dashboard development, and predictive churn modeling.