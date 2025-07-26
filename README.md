# 🍽️ SQL Case Study: Swiggy

## 📊 Overview

This SQL case study explores restaurant data from **Swiggy** to uncover deep insights into ratings, cuisine preferences, pricing strategies, and restaurant performance. The project is designed to demonstrate practical SQL skills for data-driven business decision-making.

**Author:** Prem Kumar  
**Case Study Type:** Restaurant Data Analytics  
**Platform Used:** Snowflake
**PDF Link:** [SQL-Case-Study-Swiggy_Prem.pdf](https://github.com/Premkumar9799817360/Sql_case_study_Swiggy/blob/main/SQL-Case-Study-Swiggy_Prem.pdf)

---

## 🔍 Questions Solved in This Case Study

### 🏆 Restaurant Performance Analysis

- **Q1:** How many restaurants have a rating greater than 4.5?
- ```sql
  select count( distinct restaurant_name) as total_restaurant from swiggy where rating > 4.5;
  
- **Q2:** Which is the top 1 city with the highest number of restaurants?
- ``` sql
  select city, count(distinct restaurant_name) as total_restaurnt from swiggy
  group by city 
  order by total_restaurnt desc
  limit 1;
  
- **Q3:** How many restaurants have the word "Pizza" in their name?
- ``` sql
     select distinct restaurant_name as name_of_restaurant from swiggy
    where upper(restaurant_name) like '%PIZZA%';


---

### 🍽️ Cuisine and Rating Insights

- **Q4:** What is the most common cuisine among the restaurants in the dataset?
- ``` sql
  select cuisine,count(*)as cuisine_count from swiggy
  group by cuisine
  order by cuisine_count desc
  limit 1;
     
- **Q5:** What is the average rating of restaurants in each city?
- ```sql 
      select city, round(avg(rating),2) as avg_rating from swiggy
      group by city
---

### 💰 Menu and Pricing Deep Dive

- **Q6:** What is the highest price of an item under the 'Recommended' menu category for each restaurant?
- ```sql
  select distinct restaurant_name,
  menu_category,
  max(price)as highestprice from swiggy
  where menu_category = 'Recommended'
  group by restaurant_name,menu_category
  order by highestprice desc;
  
- **Q7:** Find the top 5 most expensive restaurants that offer cuisine other than Indian cuisine.
-  ```SQL
      select distinct restaurant_name , cost_per_person from swiggy
      where cuisine != 'Indian' and cost_per_person is not null
    order by cost_per_person desc
    limit 5;
   

---

### 📈 Cost Analysis & Anomaly Detection

- **Q8:** Find the restaurants that have an average cost which is higher than the total average cost of all restaurants.
- ```SQL
  select distinct restaurant_name  from swiggy
  where cost_per_person> (select avg(cost_per_person) as avg_cost from swiggy)
  

---

### 🆔 Restaurant Identification & Uniqueness

- **Q9:** Retrieve the details of restaurants that have the same name but are located in different cities.
- ``` sql
      select distinct a.restaurant_name,a.city,b.city from swiggy a
    join swiggy b
    on a.restaurant_name = b.restaurant_name
    and a.city != b.city

---

### 📋 Menu Breadth & Specialisation

- **Q10:** Which restaurant offers the most number of items in the 'Main Course' category?
- ```sql
  select restaurant_name,count(item) as most_num_item  from swiggy
    where MENU_CATEGORY = 'Main Course'
  group by restaurant_name
  order by most_num_item desc
  limit 1;
  
- **Q11:** Which top 5 restaurants offer the highest number of categories?
- ```sql
  select restaurant_name , count(distinct menu_category) as highest_cat from swiggy
  group by restaurant_name
  order by highest_cat desc 
  limit 5;
  

### 🥗 Vegetarian & Non-Vegetarian Offerings

- **Q12:** List the names of restaurants that are 100% vegetarian in alphabetical order of restaurant name.
- ``` sql
    select distinct restaurant_name from swiggy
  where restaurant_name not in (select distinct restaurant_name from swiggy
    where VEG_OR_NONVEG='Non-veg');
- ```sql
     select restaurant_name,
  count(case when veg_or_nonveg = 'Veg' then 1 end)*100.0/count(*) as veg_prec
  from swiggy
  group by restaurant_name
  having veg_prec=100.0

  
- **Q13:** Which restaurant provides the highest percentage of non-vegetarian food?
- ```sql
  select restaurant_name,
  round(100.*(count(case when veg_or_nonveg = 'Non-veg' then 1 end))/count(*),2) as non_veg_prec
  from swiggy
  group by restaurant_name
  order by non_veg_prec desc 
  limit 5;
---

### 📉 Pricing Efficiency

- **Q14:** Which is the restaurant providing the lowest average price for all items?
- ```sql
  select distinct restaurant_name,
  avg(price) as average_price
  from swiggy 
  group by restaurant_name
  order by average_price limit 1
---

## 📄 View the Full Case Study PDF

You can view the detailed case study PDF here:  
👉 [SQL-Case-Study-Swiggy_Prem.pdf](./SQL-Case-Study-Swiggy_Prem.pdf)

---

## 🧠 Key Takeaways

- We used SQL queries to analyze Swiggy’s restaurant ecosystem from multiple perspectives.
- Insights help Swiggy understand customer trends, menu pricing, and city-based performance.
- Useful for both business intelligence and data science projects.

---

## 🔮 Future Recommendations

- Add **time-series** analysis to study growth trends.
- Use **sentiment analysis** on customer reviews.
- Explore **geographical heatmaps** of restaurant clusters.

---

## 🙌 Final Notes

```sql
SELECT
  'Thank You for your time and attention!' AS gratitude,
  'For being a part of this SQL journey' AS note,
  'Presented by Prem Kumar' AS speaker,
  'Keep writing queries, not excuses' AS inspiration
FROM Sql_Case_Study;
