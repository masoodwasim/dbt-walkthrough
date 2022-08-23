/* Example 1  */
/*
{%- set tabletype = "orderstable" -%}
select
orderid,
'{{tabletype}}' as tabletype
from {{ ref('stg_orders') }}

*/
/* Example 2 */

/*
{%- set category = "Furniture" -%}
select
orderid,
case when category = '{{category}}' then orderprofit end as {{category}}_orderprofit
from {{ ref('stg_orders') }}

*/

/* Example 3 */

{%- set category = ["Furniture", "Office", "Technology"] -%}
select
orderid,
{%- for category in category %}
sum(case when category = '{{category}}' then orderprofit end) as {{category}}_orderprofit
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('stg_orders') }}
group by 1