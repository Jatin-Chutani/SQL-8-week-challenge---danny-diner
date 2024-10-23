 -- 1. What is the total amount each customer spent at the restaurant?
use danny_diner;

select customer_id, sum(price)
from sales
inner join menu
on sales.product_id = menu.Product_id
Group by customer_id;



-- 2. How many days has each customer visited the restaurant?
select customer_id,count(customer_id) from sales group by customer_id;
select customer_id, count(distinct order_date) as days
from sales
group by customer_id;






-- 3. What was the first item from the menu purchased by each customer?
select distinct  sales.customer_id, menu.product_name, sales.order_date from sales join menu on sales.product_id = menu.product_id
group by customer_id;




-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

Select product_name, count(order_date) as Orders from Sales as S Join Menu M 
On S.product_id = M.product_id
Group by product_name
order by count(order_date) desc
limit 1;


-- 5. Which item was the most popular for each customer?

Select product_name, customer_id,  count(order_date) as orders from sales as S join Menu M On S.product_id = M.product_id
Group by product_name, customer_id
order by count(order_date) Desc;


-- 6. Which item was purchased first by the customer after they became a member?
Select S.customer_id, order_date, Join_date, product_name from sales as S inner join members as MEM on MEM.customer_id = S.customer_id
inner join Menu as M On S.product_id = M.product_id
where order_date>= Join_date
group by customer_id
order by customer_id;




-- 7. Which item was purchased just before the customer became a member?

Select S.customer_id, order_date, Join_date, product_name from sales as S inner join members as MEM on MEM.customer_id = S.customer_id
inner join Menu as M On S.product_id = M.product_id
where order_date < Join_date
group by customer_id
order by customer_id;


-- 8. What is the total items and amount spent for each member before they became a member?

Select S.customer_id, count(product_name) as total_items,
 Sum(price) as amount_spent 
 from sales as S inner join members as MEM 
 on MEM.customer_id = S.customer_id
inner join Menu as M On S.product_id = M.product_id
where order_date < Join_date
group by S.customer_id;


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?


Select customer_id, product_id from sales
group by customer_id inner join Menu on menu.product_id = sales.product_id
Where product_name like Sushi;
