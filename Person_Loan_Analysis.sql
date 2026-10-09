# highest default rate by credit score range
SELECT
	CASE 
		WHEN bp.credit_score BETWEEN 520 AND 599 THEN '520-599'
        WHEN bp.credit_score BETWEEN 600 AND 649 THEN '600-649'
        WHEN bp.credit_score BETWEEN 650 AND 699 THEN '650-699'
        WHEN bp.credit_score BETWEEN 700 AND 749 THEN '700-749'
        ELSE '750+'
        END AS credit_score_bucket,
        
        COUNT(*) AS total_loans,
        SUM(la.defaulted) AS defaulted_loans, 
        
         ROUND(
        100.0 * SUM(la.defaulted) / COUNT(*), 2
    ) AS default_rate_pc
    
FROM loan_applications la
 LEFT JOIN borrower_profiles bp
 ON la.borrower_id = bp.borrower_id
GROUP BY credit_score_bucket
ORDER BY credit_score_bucket DESC
;

# Relationship between DTI and defaulting 
SELECT 
	CASE 
		WHEN la.dti_ratio BETWEEN 0 AND 25 THEN '0-25'
        WHEN la.dti_ratio BETWEEN 26 AND 50 THEN '26-50'
        WHEN la.dti_ratio BETWEEN 51 AND 75 THEN '51-75'
        WHEN la.dti_ratio BETWEEN 76 AND 100 THEN  '76-100'
        WHEN la.dti_ratio BETWEEN 101 AND 125 THEN '101-125'
        ELSE '125+'
        END AS dti_ratio_bucket,
        
        COUNT(*) AS total_loans,
        SUM(la.defaulted) AS defaulted_loans, 
        
         ROUND(
        100.0 * SUM(la.defaulted) / COUNT(*), 2
    ) AS default_rate_dti
    
FROM loan_applications la
GROUP BY dti_ratio_bucket
ORDER BY dti_ratio_bucket ASC
;

#Highest default rate by loan purpose
SELECT 
	  loan_purpose,
	  COUNT(*) AS total_loans,
      
	  SUM(defaulted) AS defaulted_loans, 
        
         ROUND(
        100.0 * SUM(defaulted) / COUNT(*), 2
    ) AS default_rate_loan_purpose 
FROM loan_applications
GROUP BY loan_purpose
ORDER BY default_rate_loan_purpose DESC
;

# Default right by employmnent and years employed 
SELECT  
	  bp.employment_status,
	  COUNT(*) AS total_loans,
      
	  SUM(defaulted) AS defaulted_loans, 
        
         ROUND(
        100.0 * SUM(defaulted) / COUNT(*), 2
    ) AS default_rate_employment_status 
FROM loan_applications la
 LEFT JOIN borrower_profiles bp
 ON la.borrower_id = bp.borrower_id
 GROUP BY bp.employment_status
 ORDER BY default_rate_employment_status DESC
 ;
 
 # Default rate by borrowers with less then 2 years employed 

SELECT 
    CASE
        WHEN bp.years_employed < 2 THEN 'Less than 2 years'
        ELSE '2 years or more'
    END AS employment_length_group,

    COUNT(*) AS total_loans,
    SUM(la.defaulted) AS defaulted_loans,

    ROUND(
        100.0 * SUM(la.defaulted) / COUNT(*), 2
    ) AS default_rate_years_employed

FROM loan_applications la
LEFT JOIN borrower_profiles bp
    ON la.borrower_id = bp.borrower_id

GROUP BY employment_length_group
ORDER BY default_rate_years_employed DESC
;