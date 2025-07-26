drop databse if exists swiggy
create database swiggy
use swiggy

-- create table insert data 

-- Fatch data 
SELECT * FROM PUBLIC.SWIGGY LIMIT 10;



-- Question 1:
-- HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count( distinct restaurant_name) as total_restaurant from swiggy where rating > 4.5;

-- Question 2:
--  WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city, count(distinct restaurant_name) as total_restaurnt from swiggy
group by city 
order by total_restaurnt desc
limit 1;

-- Question 3:
--  HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

select distinct restaurant_name as name_of_restaurant from swiggy
where upper(restaurant_name) like '%PIZZA%';
-- OR
select count(distinct restaurant_name) total_restaurant from swiggy
where upper(restaurant_name) like '%PIZZA%';

-- Question 4:
--  WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine,count(*)as cuisine_count from swiggy
group by cuisine
order by cuisine_count desc
limit 1;

-- Question 5:
-- WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY
select city, round(avg(rating),2) as avg_rating from swiggy
group by city

-- Question 6:
-- WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name,
menu_category,
max(price)as highestprice from swiggy
where menu_category = 'Recommended'
group by restaurant_name,menu_category
order by highestprice desc;


-- Question 7:
-- FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN
 I NDIAN CUISINE. 
select distinct restaurant_name , cost_per_person from swiggy
where cuisine != 'Indian' and cost_per_person is not null
order by cost_per_person desc
limit 5;

-- Question 8:
-- FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE
 TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER. 
select distinct restaurant_name  from swiggy
where cost_per_person> (select avg(cost_per_person) as avg_cost from swiggy)

-- Question 9
-- RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE
 LOCATED IN DIFFERENT CITIES. 
select distinct a.restaurant_name,a.city,b.city from swiggy a
join swiggy b
on a.restaurant_name = b.restaurant_name
and a.city != b.city

--Question 10
-- WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select restaurant_name,count(item) as most_num_item  from swiggy
where MENU_CATEGORY = 'Main Course'
group by restaurant_name
order by most_num_item desc
limit 1;


-- Question 11
-- WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES
select restaurant_name , count(distinct menu_category) as highest_cat from swiggy
group by restaurant_name
order by highest_cat desc 
limit 5;

--Question 12
-- LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME
select distinct restaurant_name from swiggy
where restaurant_name not in (select distinct restaurant_name from swiggy
where VEG_OR_NONVEG='Non-veg')
order by restaurant_name;

--second approach
select 
restaurant_name,
count(case when veg_or_nonveg = 'Veg' then 1 end)*100.0/count(*) as veg_prec
from swiggy
group by restaurant_name
having veg_prec=100.0
order by restaurant_name

-- Question 13:
--  WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD
select 
restaurant_name,
round(100.*(count(case when veg_or_nonveg = 'Non-veg' then 1 end))/count(*),2) as non_veg_prec
from swiggy
group by restaurant_name
order by non_veg_prec desc 
limit 5;

--Question 14
-- WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select distinct restaurant_name,
avg(price) as average_price
from swiggy 
group by restaurant_name
order by average_price limit 1

