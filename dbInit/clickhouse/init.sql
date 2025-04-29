create table sales_per_customers (
	time DateTime default now(),
	data String
)
engine = MergeTree()
order by time;

create table products (
	time DateTime default now(),
	data String
)
engine = MergeTree()
order by time;

create table sales_per_times (
	time DateTime default now(),
	`data` String
)
engine = MergeTree()
order by time;

create table sales_per_stores (
	time DateTime default now(),
	`data` String
)
engine = MergeTree()
order by time;

create table sales_per_suppliers (
	time DateTime default now(),
	`data` String
)
engine = MergeTree()
order by time;

create table quality_of_products (
	time DateTime default now(),
	`data` String
)
engine = MergeTree()
order by time;
