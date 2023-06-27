use census
#find the number of rows in the datasets?
 
 select 
 count(*) as total_dataset 
 from data_1;
 select 
 count(*) as total_dataset 
 from data_2;

 # find the dataset for Jharkhand and Bihar?

 select *
 from data_1
 where state in ('Jharkhand','Bihar');

 # Total popuation of the India?

select sum(population) as total_population
from data_2;

# Average Growth from data_1 fron every state?

select state,avg(Growth)*100 as avg_growth 
from data_1
group by State

#Average sex-ratio by state and order by desc?

select state,round(avg(Sex_Ratio),0) as avg_sex_ratio
from data_1
group by state
order by avg(Sex_Ratio) desc

# Find average literacy which is greater than 90?

select state,round(avg(Literacy),0) as avg_literacy
from data_1
group by state
having round(avg(Literacy),0)>90
order by avg(Literacy) desc


# Top 3 state showing highest growth ratio?
  select top 3 state,round(avg(growth)*100,0) as avg_growth
  from data_1
  group by state
  order by round(avg(growth)*100,0) desc


# Top and bottom three state of average literacy rate?

select * from 
(select Top 3 state,round(avg(Literacy),0) as avg_literacy 
from data_1
group by state
order by round(avg(Literacy),0) desc) as A

union

select * from 
(select top 3 state,round(avg(Literacy),0) as avg_literacy 
from data_1
group by state
order by round(avg(Literacy),0) asc) as B