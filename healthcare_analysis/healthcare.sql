select * from healthcare_dataset;
select distinct(`Medical Condition`) from healthcare_dataset;

# Returns the amount of clients for each Insurance Provider
select `Insurance Provider`, count(`Insurance Provider`) 'Number of Clients' from healthcare_dataset
group by `Insurance Provider`;

# Queries all the patients whose test results were inconclusive for the month of December 2022
select * from healthcare_dataset 
where `Test Results` = 'Inconclusive' and 
`Date of Admission` between '2022-12-01' and '2022-12-31'
order by `Date of Admission`;


