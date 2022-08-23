/*
select *,
ordersellingprice - ordercostprice as orderprofit
from {{ ref('raw_orders') }}

*/

/* Execute particular model with dependencies run command - dbt run -s +stg_orders   */

select 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
c.customerid,
c.customername,
c.segment,
c.country,
p.category,
p.productid,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_products') }} as p
on o.productid=p.productid




