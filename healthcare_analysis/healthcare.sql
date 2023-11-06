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

# Queries all the patients who have stayed for 30 days or more in the year 2022
select Name, Age, `Medical Condition`, `Date of Admission`, `Discharge Date`, datediff(`Discharge Date`, `Date of Admission`) 'Days Stayed' from healthcare_dataset
where datediff(`Discharge Date`, `Date of Admission`) >= 30 and year(`Date of Admission`) = 2022;

# Queries a summary of the patients who have been admitted more than once in 2022
with timesAdmitted as (
	select Name, count(*) 'Times Admitted' from healthcare_dataset
    where year(`Date of Admission`) = 2022
    group by Name
)
select Name, `Medical Condition`, `Date of Admission`, `Test Results` from healthcare_dataset
where Name in (select Name from timesAdmitted where `Times Admitted` >= 2) and year(`Date of Admission`) = 2022
order by Name, `Date of Admission`;

