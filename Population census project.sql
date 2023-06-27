use census
#find the number of rows in the datasets?
 
 select 
		count(*) as total_dataset 
	from 
		data_1;

 select 
		count(*) as total_dataset 
	from 
		data_2;

 # find the dataset for Jharkhand and Bihar?

 select 
		*
	from 
		data_1
	where 
		state in ('Jharkhand','Bihar');

 # Total popuation of the India?

	select 
		sum(population) as total_population
	from 
		data_2;

# Average Growth from data_1 fron every state?

	select 
		state,avg(Growth)*100 as avg_growth 
	from
		data_1
	group by 
		State

#Average sex-ratio by state and order by desc?

	select
		state,round(avg(Sex_Ratio),0) as avg_sex_ratio
	from 
		data_1
	group by 
		state
	order by 
		avg(Sex_Ratio) desc

# Find average literacy which is greater than 90?

	select
		state,round(avg(Literacy),0) as avg_literacy
	from 
		data_1
	group by 
		state
	having 
		round(avg(Literacy),0)>90
	order by
		avg(Literacy) desc


# Top 3 state showing highest growth ratio?
  
  select 
	top 3 state,round(avg(growth)*100,0) as avg_growth
  from 
	data_1
  group by 
	state
  order by 
	round(avg(growth)*100,0) desc


# Top and bottom three state of average literacy rate?

select
	* 
		from 
			(select Top 3 state,round(avg(Literacy),0) as avg_literacy 
		from 
			data_1
		group by 
			state
		order by
			round(avg(Literacy),0) desc) as A

		union

		select 
				* 
				from 
					(select top 3 state,round(avg(Literacy),0) as avg_literacy 
				from 
					data_1
				group by 
					state
				order by 
					round(avg(Literacy),0) asc) as B


	# Calculate the total number of males and females ?
	

	select c.District,c.state,round(c.Population/c.sex_ratio + 1,0) as Male,round(c.Population * c.sex_ratio/ c.sex_ratio +1,0) as Females from
	(select a.District,a.state,a.Sex_Ratio/1000 as sex_ratio,b.Population
	from 
		data_1 as a
		inner join
		data_2 as b
	on 
		a.District = b.District)c

	#Find the total literacy rate?
	
	select d.state,sum(total_literacy_people)as total_literate,sum(Illiterate_people)as total_illeterate from
	(select c.District,c.state,round(c.literacy*population,0) as total_literacy_people,round((1-c.Literacy)*c.population,0) as Illiterate_people
	from
	(select 
		a.District,a.state,a.Literacy/100 as literacy,b.population
	from
		data_1 as a
		inner join 
		data_2	as b
		on 
		a.District = b.District) as c)as d
		group by d.state

		#Population in previous census?

		select * from data_1
		select * from data_2

		select c.state,c.District,c.population/1+c.Growth as previous_census
		from
		(select a.District,a.state,b.population,a.Growth
				from 
					data_1 as a
				inner join 
					data_2 as b
				on 
				a.District = b.District)as c
				



