# Top 2000 Global Companies Analysis

This project analyzes financial data of the top 2000 global companies from 2024. Using SQL, we extract insights into revenue, profit, market capitalization, and other key metrics. The dataset includes information about company names, countries, sales, profits, assets, and market values.

---

## Dataset Overview

| Column Name            | Data Type | Description                                      |
|------------------------|-----------|--------------------------------------------------|
| S.N                    | int       | Serial number of the company                    |
| Name                  | text      | Name of the company                              |
| Country               | text      | Country where the company is headquartered       |
| Sales                 | text      | Revenue in formatted text with dollar signs      |
| Profit                | text      | Net income in formatted text with dollar signs   |
| Assets                | text      | Total assets in formatted text with dollar signs |
| Market Value          | text      | Market value in formatted text with dollar signs |
| sales_in_dollars      | bigint    | Revenue in numeric format for analysis           |
| profit_in_dollars     | bigint    | Profit in numeric format for analysis            |
| assets_in_dollars     | bigint    | Assets in numeric format for analysis            |
| market_value_in_dollars | bigint  | Market value in numeric format for analysis      |

---

## Project Objectives

1. Extract and visualize key financial insights using SQL.
2. Perform country-wise, region-wise, and industry-level analysis.
3. Identify relationships in financial performance.
4. Showcase SQL proficiency for analytical and reporting tasks.

---

## Analytical Queries

### General Overview
1. Top 10 companies by total revenue, net income, and market capitalization.
2. Distribution of companies by country.

### Revenue and Profit Analysis
3. Average, median, and range of revenues across companies.
4. Industries with high revenues but low profitability.

### Market Capitalization Insights
5. Market Capitalization Correlation with Revenue
6. Companies with the largest gap between market capitalization and revenue.
7. Largest Difference Between Market Capitalization and Assets
8. Market capitalization-to-assets ratio for each company.

### Assets Analysis
9. Companies with the largest assets
10. Relationship Between Assets and Revenue

### Profitability Insights
11. Companies with the lowest profit margins.
12. Companies with a large gap between profit and sales.

---

## Repository Structure

```plaintext
├── data/                    # Folder for raw and cleaned datasets
├── Outputs/          # Visual outputs
├── README.md                # Project documentation
├── Top 2000 Companies Financial Data Analysis                 # SQL scripts for analysis
```

---

## How to Use

### Prerequisites
1. Install MySQL Workbench (or any SQL client).
2. Import the dataset into a MySQL database.

### Steps to Run the Queries
1. Clone the repository:
   ```bash
   git clone https://github.com/Fayez302/MySQL_Global_Companies_Financial_Data_Analysis.git
   ```
2. Navigate & Execute the SQL scripts in your database client.

---

## Example Insights

- The United States hosts the highest number of companies, with an average revenue of 20135.9billion.
- Companies in the technology sector show the highest market capitalization-to-revenue ratio..

---

## Contributions
Contributions are welcome! Feel free to fork the repository and submit pull requests.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

