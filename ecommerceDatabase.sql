create database e_commerce;
use e_commerce;

create table product (
product_id int primary key auto_increment,
brand_id int,
productCategoryId int,
name varchar(50) not null,
description varchar(50) not null,
base_price decimal(10, 2) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,

foreign key(brand_id) references brand(brand_id),
foreign key(productCategoryId) references product_category(productCategoryId)
);

 create table product_image(
 image_id int primary key auto_increment,
 product_id int not null,
 image_url text not null,
 alt_text varchar(255), 
 created_at timestamp default current_timestamp,

foreign key(product_id) references product(product_id)
 );

create table color(
color_id int primary key auto_increment,
name varchar(50) not null unique,
hex_value varchar(8),
created_at timestamp default current_timestamp
);

create table product_category(
productCategoryId int primary key auto_increment,
name varchar(50) not null unique,
description text,
created_at timestamp default current_timestamp
);



create table product_item(
item_id int primary key auto_increment,
product_id int not null,
stock_keeping varchar(100) not null unique,
price decimal(10, 2) not null,
stock_quantity int default 0,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp, 

foreign key (product_id) references product(product_id)
);

create table brand(
brand_id int primary key auto_increment,
name varchar(50),
description text, 
log_url text,
created_at timestamp default current_timestamp
);

create table product_variation(
variation_id int primary key auto_increment,
item_id int,
color_id int, 
option_id int, 
created_at timestamp default current_timestamp,

foreign key (item_id) references product_item(item_id),
foreign key (color_id) references color(color_id),
foreign key (option_id) references size_option(option_id)
);

create table size_category(
sizeCategoryId int primary key auto_increment,
name varchar(50),
description text,
created_at timestamp default current_timestamp
);

create table size_option(
option_id int primary key auto_increment,
sizeCategoryId int,
size_value varchar(10),
created_at timestamp default current_timestamp,

foreign key (sizeCategoryId) references size_category(sizeCategoryId)
);

create table product_attribute(
attribute_id int primary key auto_increment,
product_id int,
name varchar(50), 
value varchar(50),
created_at timestamp default current_timestamp,

foreign key (product_id) references product(product_id)
);

create table attribute_category(
attributeCategoryId int primary key auto_increment,
name varchar(50),
description text,
created_at timestamp default current_timestamp
);

create table attribute_type(
attributeTypeId int primary key auto_increment,
attributeCategoryId int,
name varchar(50),
description text,
created_at timestamp default current_timestamp,

foreign key(attributeCategoryId) references attribute_category(attributeCategoryId) 

);

