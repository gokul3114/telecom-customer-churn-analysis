create database telecom_churn;
use telecom_churn;
select * from telco_churn;
select count(*) from telco_churn;

-- 1. How many customers are there in total?

       select count(*) from telco_churn;

-- 2. How many customers have churned?

   select count(churn) as totally_churned from telco_churn
        where churn = "Yes";

-- 3. How many customers are currently retained?
     
      select count(churn) as totally_retained from telco_churn
        where churn = "No"; 

-- 4. What is the overall customer churn rate (%)?

           SELECT
              ROUND(
                    (COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
                   2
				   ) AS churn_rate_percentage
           FROM telco_churn;

-- 5. What is the average customer tenure?

   select churn,
          round(avg(tenure),2) AS avg_customer_tenure from telco_churn
          group by churn;

-- 6. What is the average monthly charge?
    
    select round(avg(monthlycharges),2) from telco_churn;
       
-- 7. What is the average total charge?

    select round(avg(totalcharges),2) from telco_churn;

-- 8. What are the minimum, maximum, and average tenure values?
  
    select min(tenure),
           max(tenure),
           avg(tenure) from telco_churn;

-- 9. What are the minimum, maximum, and average monthly charges?
    
       select min(monthlycharges),
           max(monthlycharges),
           avg(monthlycharges) from telco_churn;

-- 10. What are the minimum, maximum, and average total charges?

       select min(totalcharges),
           max(totalcharges),
           avg(totalcharges) from telco_churn;

-- 11. How many unique contract types are available?
    
        select contract,
               count(distinct(contract)) from telco_churn
               group by contract;

-- 12. How many unique payment methods are available?
 
      select paymentmethod,
             count(distinct(paymentmethod)) from telco_churn
             group by paymentmethod;

-- 13. How many customers use each internet service type?
     
        select internetservice,
             count(internetservice) as total_customers from telco_churn
             group by internetservice
             order by total_customers desc;   

-- 14. How many customers use each contract type?
 
           select contract,
               count(contract) as total_customer from telco_churn
               group by contract       
               order by total_customer desc;
               
-- 15. How many customers use each payment method?
        
             select paymentmethod,
             count(paymentmethod) as total_customers from telco_churn
             group by paymentmethod
             order by total_customers desc ;

-- 16.Which contract type has the highest churn rate?
      
      select contract,
             count(*) as total_customers,
              sum(case when churn="Yes" then 1 else 0 end) as churned_customer,
              round(sum(case when churn="yes" then 1 else 0 end)*100.0/count(*),2)
              as churn_rate
		 from telco_churn
         group by contract
         order by churn_rate desc;      # month-to-month  as more churn 42.71%

-- 17.Which payment method has the highest churn?
    
        select paymentmethod,
			   count(*) as total_customers,
               sum(case when churn ="Yes" then 1 else 0 end) as highest_churn
		from telco_churn
        group by paymentmethod    
        order by highest_churn desc;      #  electronic check has 2365 churn

-- 18.Does tenure affect churn?

     SELECT
    churn,
    ROUND(AVG(tenure),2)
      FROM telco_churn   
       GROUP BY churn;     # NO IT DOESNT

-- 19.Which internet service customers churn more?

          select internetservice,
			   count(*) as total_customers,
               sum(case when churn ="Yes" then 1 else 0 end) as highest_churn
		from telco_churn
        group by internetservice
        order by highest_churn desc;      # highest fiber optic=1297

-- 20.Do senior citizens churn more than non-senior citizens??

            select seniorcitizen,
			   count(*) as total_customers,
               sum(case when churn ="Yes" then 1 else 0 end) as highest_churn
		from telco_churn
        group by seniorcitizen
        order by highest_churn desc;      # yes senior citizen has more churn

-- 21.Do customers with partners churn less?
        
        SELECT
    Partner,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_churn), 2) AS customer_percentage,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY Partner
ORDER BY churn_rate DESC; 

-- 22.Do dependents affect churn?
    
     SELECT
    dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY dependents
ORDER BY churn_rate DESC;
    

-- 23.Which additional services (Online Security, Tech Support, etc.) are associated with lower churn?

# online security
     SELECT
    onlinesecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;

#onlinebackup
SELECT
    onlinebackup,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY onlinebackup
ORDER BY churn_rate DESC;

#DEVICE PROTECTION
SELECT
    deviceprotection,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY deviceprotection
ORDER BY churn_rate DESC;

#TECHSUPPORT
SELECT
     techsupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY  techsupport
ORDER BY churn_rate DESC;

#STREAMING TV
SELECT
   streamingtv,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY streamingtv
ORDER BY churn_rate DESC;

#STREAMING MOVIES
SELECT
    streamingmovies,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY streamingmovies
ORDER BY churn_rate DESC;

-- 24.Which customers pay the highest monthly charges?
        
        select customerid,
        max(monthlycharges) as highest_payer from telco_churn 
        group by customerid
        order by highest_payer desc limit 1;     #customerid =7569-NMZYQ pays 118.75


-- 25.Which customer segment generates the most revenue?

          SELECT
    Contract,
    COUNT(*) AS total_customers,
    ROUND(SUM(TotalCharges),2) AS total_revenue
FROM telco_churn
GROUP BY Contract
ORDER BY total_revenue DESC;      # customer with 2 years generate more revenue

-- 26.Does paperless billing influence churn?

       select paperlessbilling,count(*) as total_customers,
       sum(case when churn="yes" then 1 else 0 end) as churn_customers,
       round(sum(case when churn="yes" then 1 else 0 end)*100.0/count(*),2) as churn_rate
       from telco_churn
       group by paperlessbilling
       order by churn_rate;      # yes paperbilling churn rate is 33 percent
       
-- 27.Which gender has a higher churn rate?
      
      select gender,count(*) as total_customers,
       sum(case when churn="yes" then 1 else 0 end) as churn_customers,
       round(sum(case when churn="yes" then 1 else 0 end)*100.0/count(*),2) as churn_rate
       from telco_churn
       group by gender
       order by churn_rate;      # slight difference female has 26.92 and male as 26.16 
      