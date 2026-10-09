# Loan Default Risk Analysis Using SQL

## Project Overview

In this project, I’m analyzing loan and borrower data for Horizon Financial Group to better understand why some borrowers default on their loans.

The company has issued over 600 personal loans across 2024 and 2025, and approximately 1 in 4 loans are defaulting. Since the company's target default rate is 12%, the goal of this project is to explore the data and identify borrower or loan characteristics that may be related to higher default rates.

I’m using SQL to explore the data, compare default rates, and look for patterns that could help the company make more informed lending decisions.

## Business Questions

* How do default rates differ across credit score ranges?
* Which loan purposes have the highest default rates?
* How do employment status and years employed relate to default risk?
* Are borrowers with less than two years of employment more likely to default?

## Tools and Skills

* **MySQL** — querying and analyzing data
* `SELECT` — selecting data for analysis
* `JOIN` — combining borrower and loan information
* `GROUP BY` — grouping data to compare categories
* Aggregate functions — calculating loan counts and default rates
* `CASE WHEN` — grouping credit scores and employment years into categories

## Dataset

The project uses two datasets:

* **Borrower Profiles:** Includes borrower information such as income, credit score, and employment.
* **Loan Applications:** Includes loan details such as loan amount, term, interest rate, and repayment status.

The datasets are used together to explore how borrower characteristics and loan details relate to loan defaults.

## Analysis

I’m using SQL to group loans by different borrower and loan characteristics, calculate default rates, and compare the results across categories.

The goal is to understand which factors are associated with higher default rates rather than assume that any one characteristic causes a borrower to default.

## Key Findings

This project is still in progress. I’ll update this section once I’ve completed the queries and reviewed the results.

## Project Goal

This project gives me an opportunity to practice SQL using a business problem and build my data analysis skills. It also helps me learn how to turn data into findings that can support business decisions.
