create database zepto;
use zepto;
 select count(*) from zeptoproject;
 select * from zeptoproject limit 10;
ALTER TABLE zeptoproject 
ADD COLUMN skw_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

select * from zeptoproject where category is null 
or name is null
or mrp is null
or discountPercent is null
or availableQuantity is null
or  discountedSellingPrice is null
or weightInGms is null
or outOfStock is null
or quantity is null;

select distinct category from zeptoproject order by category;
select outOfStock,count(skw_id) from zeptoproject group by outOfStock;
select name,count(skw_id) as 'no_of_skw' from zeptoproject group by name having count(skw_id)>1 order by count(skw_id) desc;

select * from  zeptoproject  where mrp =0 or discountedSellingPrice =0;
delete from zeptoproject where mrp =0;

update zeptoproject set mrp=mrp/100.0,discountedSellingPrice=discountedSellingPrice/100.0;
select mrp,discountedSellingPrice from zeptoproject;

SELECT DISTINCT name, mrp, discountPercent
FROM zeptoproject
ORDER BY discountPercent DESC
LIMIT 10;

 select distinct name,mrp  from  zeptoproject where outOfStock = TRUE and mrp > 300 order by mrp desc ;
 
 select category,sum(discountedSellingPrice * availableQuantity) as totalrevenue from zeptoproject group by category order by totalrevenue;

select distinct name ,mrp,discountPercent from zeptpproject where mrp > 500 and discountPercent < 10 order by discountPercent desc limit 10;

select distinct name,mrp from zeptoproject where outOfStock = TRUE and mrp>300 order by mrp desc;

select category,round(avg(discountPercent),2) as avg_discount from zeptoproject group by category order by avg_discount desc limit 5;

select distinct name,weightInGms,discountedSellingPrice,round(discountedSellingPrice/weightInGms,2) as pricepergms
from zeptoproject where weightInGms >= 100 order by pricepergms;

select  distinct name,weightInGms,
case when weightInGms <=1000 then 'low'
     when weightInGms <=5000 then 'medium'
     else'bulk'
     end as weightcategory from zeptoproject;
     
     select category,sum(weightInGms * availableQuantity) as totalweight from zeptoproject group by category order by totalweight;
