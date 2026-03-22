use project_pipeline;

#Retrieve the dirty dataframe from python.
select*from raw_orders;

#Identify duplicates orders using group by and having
select order_id, count(*) as total_orders from raw_orders group by order_id having count(*) >1;

#Deduplicate orders (keep unique ones) and clean and handle null values in customer_id and amount column.
select * from (select order_id, customer_id, coalesce(amount,0) as amount_, product, row_number() over(partition by order_id order by amount DESC) as rank_order from raw_orders
where customer_id is not null) ord
 where rank_order=1
;

# The cleaned data is stored in a new table
CREATE TABLE clean_orders  AS select order_id, customer_id, amount, product from (select order_id, customer_id, coalesce(amount,0) as amount, product, row_number() over(partition by order_id order by amount DESC) as rank_order from raw_orders
where customer_id is not null) ord
 where rank_order=1
;

#Evaluation of the data quality for cleaned data vs original dataframe.
#DQ metrics
select (SELECT COUNT(*) from raw_orders) as raw_orders_total,
        (SELECT COUNT(*) from clean_orders) as clean_orders_total;
        
select (select concat('removed_rows')) as metric,  
       (select count(*) from raw_orders) - (Select count(*) from clean_orders) as value ;
