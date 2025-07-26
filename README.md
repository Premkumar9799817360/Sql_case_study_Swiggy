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
- **Q3:** How many restaurants have the word "Pizza" in their name?

---

### 🍽️ Cuisine and Rating Insights

- **Q4:** What is the most common cuisine among the restaurants in the dataset?
- **Q5:** What is the average rating of restaurants in each city?

---

### 💰 Menu and Pricing Deep Dive

- **Q6:** What is the highest price of an item under the 'Recommended' menu category for each restaurant?
- **Q7:** Find the top 5 most expensive restaurants that offer cuisine other than Indian cuisine.

---

### 📈 Cost Analysis & Anomaly Detection

- **Q8:** Find the restaurants that have an average cost which is higher than the total average cost of all restaurants.

---

### 🆔 Restaurant Identification & Uniqueness

- **Q9:** Retrieve the details of restaurants that have the same name but are located in different cities.

---

### 📋 Menu Breadth & Specialisation

- **Q10:** Which restaurant offers the most number of items in the 'Main Course' category?
- **Q11:** Which top 5 restaurants offer the highest number of categories?

---

### 🥗 Vegetarian & Non-Vegetarian Offerings

- **Q12:** List the names of restaurants that are 100% vegetarian in alphabetical order of restaurant name.
- **Q13:** Which restaurant provides the highest percentage of non-vegetarian food?

---

### 📉 Pricing Efficiency

- **Q14:** Which is the restaurant providing the lowest average price for all items?

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
