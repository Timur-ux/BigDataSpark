create table pets (
	id bigserial primary key,
	type text,
	name text,
	breed text
);

create table customers (
	id bigserial primary key,
	first_name text,
	last_name  text,
	age int,
	email text,
	country text,
	postal_code text,
	pet_id bigint references pets(id) on delete cascade
);

create table sellers (
	id bigserial primary key,
	first_name text,
	last_name text,
	email text,
	country text,
	postal_code text
);

create table suppliers (
	id bigserial primary key,
	name text,
	contact text,
	email text,
	phone text,
	address text,
	city text,
	country text
);

create table products (
	id bigserial primary key,
	name text,
	category text,
	price text,
	quantity float,
	weight float,
	color text,
	size text,
	brand text,
	material text,
	description text,
	rating float,
	reviews int,
	release_date timestamp,
	expiry_date timestamp,
	pet_category text
);

create table stores (
		id bigserial primary key,
	  name text,
    location text,
    city text,
    state text,
    country text,
    phone text,
    email text
);

create table sales (
	id bigserial primary key,
	date timestamp,
	customer_id bigint references customers(id) on delete cascade,
	seller_id bigint references sellers(id) on delete cascade,
	store_id bigint references stores(id) on delete cascade,
	supplier_id bigint references suppliers(id) on delete cascade,
	product_id bigint references products(id) on delete cascade,
	quantity float,
	total_price float
);

alter table sales add constraint ck_quantity check (quantity > 0);
alter table sales add constraint ck_total_price check (total_price > 0);

