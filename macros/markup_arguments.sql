{% macro markup_argument(sellingprice, costprice) %}

({{sellingprice}} - {{costprice}})/{{costprice}}
{% endmacro%}