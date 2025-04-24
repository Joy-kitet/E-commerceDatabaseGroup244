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

INSERT INTO color (name, hex_value, created_at) 
VALUES
('Red', '#FF0000', NOW()),
('Blue', '#0000FF', NOW()),
('Black', '#000000', NOW());

INSERT INTO product_category (name, description, created_at)
VALUES
('Footwear', 'All kinds of shoes, sandals, and boots', NOW()),
('Clothing', 'Men and Women clothing items', NOW()),
('Electronics', 'Gadgets, phones, and accessories', NOW()),
('Accessories', 'Belts, watches, hats, and more', NOW());

INSERT INTO brand (name, created_at)
VALUES
('Nike', NOW()),
('Adidas', NOW()),
('Apple', NOW()),
('Samsung', NOW()),
('Zara', NOW()),
('H&M', NOW());

INSERT INTO attribute_category (name, description, created_at)
VALUES
('Physical', 'Attributes related to the physical characteristics of the product', NOW()),
('Technical', 'Attributes describing technical specs', NOW()),
('Descriptive', 'General descriptive attributes like style or theme', NOW());


INSERT INTO size_category (name, description, created_at)
VALUES
('Clothing Sizes', 'Sizes used for shirts, pants, dresses, etc.', NOW()),
('Shoe Sizes', 'Sizes used for footwear', NOW()),
('Ring Sizes', 'Standard sizes for rings', NOW());

INSERT INTO product (name, description, brand_id, productCategoryId, base_price, created_at, updated_at)
VALUES
('Sneakers',"Comfortable sneakers", 1, 1, 89.99, NOW(), now()),
('Heels',"Stylish high-heeled shoes", 1, 1, 79.99, NOW(), now());

insert into product_image(image_url, alt_text, product_id, created_at)
values
("https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "a photo of sneakers", 1,  now()),
("https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "a photo of heels", 2, now());

INSERT INTO product_attribute (product_id, name,  value, created_at)
VALUES
(1, 'Material',  'Leather', NOW()), 
(1, 'Weight',  '0.8', NOW()),      
(1, 'Color',  'Red', NOW()),         
(2, 'Material', 'Suede', NOW()),  
(2, 'Weight', '0.6', NOW()),       
(2, 'Color', 'Black', NOW());     

INSERT INTO product_item (product_id, stock_keeping, price, stock_quantity, created_at, updated_at)
VALUES
(1, 'SKU-SNEAKERS-M-RED', 89.99, 50, now(), now()),
(1, 'SKU-SNEAKERS-L-RED', 89.99, 30, now(), now()),
(1, 'SKU-SNEAKERS-M-BLUE', 89.99, 40, now(), now()),
(2, 'SKU-HEELS-7-BLACK', 79.99, 20, now(),now()),
(2, 'SKU-HEELS-8-BLACK', 79.99, 25, now(), now());

INSERT INTO size_option (size_value, sizeCategoryId, created_at)
VALUES 
('6', 2, now()),
('7', 2, now()),
('8', 2, now()),
('9', 2, now()),
('10', 2, now());


INSERT INTO attribute_type (attributeCategoryId, name, description)
VALUES 
(1, 'Text', 'Used for textual attributes like material or color'),
(1, 'Number', 'Used for numeric values like weight or size'),
(1, 'Boolean', 'True or false values such as waterproof'),

(2, 'Text', 'Technical textual attributes like processor or brand'),
(2, 'Number', 'Numeric technical specs like RAM or storage'),
(2, 'Boolean', 'Yes/No technical capabilities like Bluetooth');
    

INSERT INTO product_variation (item_id, color_id, option_id)
VALUES 
(1, 1, 1),  -- item 1, red, size M
(1, 1, 2),  -- item 1, red, size L
(2, 2, 1),  -- item 2, blue, size M
(2, 2, 2);  -- item 2, blue, size L
