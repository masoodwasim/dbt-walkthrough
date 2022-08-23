/*
select *,
ordersellingprice - ordercostprice as orderprofit
from {{ ref('raw_orders') }}

*/

/* Execute particular model with dependencies run command - dbt run -s +stg_orders   */

select 
{{ dbt_utils.surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} AS Sky_orders,
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
p.subcategory,
{{ markup()}} as markup,  /*using macro */
{{markup_argument('ordersellingprice','ordercostprice')}} as markupargument /*using macro with arguments*/
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid=c.customerid
left join {{ ref('raw_products') }} as p
on o.productid=p.productid
{{limit_data_in_dev('orderdate')}}  /* macro to limit the result row count */



