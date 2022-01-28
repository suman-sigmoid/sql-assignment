create database suman;
use suman;
create table airbnb(
	listing_ID varchar(10),
    Date date,
    available char,
    price float
);
desc  airbnb;
select * from airbnb;

/*----------- question 1 ---------*/
select min(Date) , max(Date) from airbnb;

/* --------- question 2 ------------*/
/* 2.1 answer. how many properties have duplicate values*/
select listing_id,Date,available,price, count(*)
  from airbnb
  group by listing_id,Date,available,price
  having count(*) > 1;
/*----------- question 3------------*/
select listing_id as property,sum(case when available = 't' then 1 else 0 end) as Available, 
sum(case when available = 'f' then 1 else 0 end) as Unavailable 
from airbnb
group by listing_id;


/*------------ question 4 -----------*/
select listing_id ,percent from( 
select listing_id,(count(case when available ='t' then 1 end)/count(*))*100 as percent
from airbnb
group by listing_id
)as temp where percent > 50;
select listing_id ,percent from(
	select listing_id,(count(case when available ='t' then 1 end)/count(*))*100 as percent
    from airbnb
	group by listing_id
)as temp where percent > 75;


/*----------- question 5 ---------*/
select listing_id as property,max(price) as Max, 
min(price) as Min, avg(price) as Average
from airbnb group by listing_id;


/*------------question 6 -----------*/
select listing_id ,price from (
            select avg(price) as Price, listing_id
            from airbnb
            group by listing_id
        )as temp     where price> 500 ;

/*---------- question 2 ----------*/
/* 2.2 part answer. Remove duplicate rows (say a row appears 3 times, remove 2 and keep 1)*/
CREATE TABLE Table3 as
SELECT distinct listing_id, date, available, price  FROM airbnb
GROUP BY listing_id, date, available, price;

select * from Table3;




        
        
        