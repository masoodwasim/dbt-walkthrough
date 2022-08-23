 
select 
    productid,
    productname,
    category,
    subcategory,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    productid,
    productname,
    category,
    subcategory

/* Execute command -- dbt run --s +report_profit_by_product   */
