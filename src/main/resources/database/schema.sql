create database if not exists growbook character set utf8 collate utf8_general_ci;

use growbook;

drop table if exists orders;
drop table if exists cart;
drop table if exists evaluation;
drop table if exists user_detail;
drop table if exists products;
drop table if exists users;

create table if not exists users(
	id int(30) not null,
	username varchar(30) not null,
	email varchar(50) not null,
	nick_name varchar(30) not null,
	role int not null,
	primary key(id),
	unique(username),
	unique(email)
);

create table if not exists user_detail(
	id int(30) not null,
	password varchar(20) not null,
	phone_number varchar(20) not null,
	gender int not null,
	birthday varchar(20) not null,
	post_number varchar(10) not null,
	address varchar(50) not null,
	register_time varchar(20) not null,
	primary key(id),
	foreign key(id) references users(id)
);

create table if not exists products(
	id int(30) not null,
	name varchar(50) not null,
	auther varchar(20) not null,
	description varchar(1000) not null,
	key_word varchar(1000) not null,
	price int not null,
	counts int not null,
	`type` int not null,
	primary key(id),
	unique(name)
);

create table if not exists cart(
	user_id int not null,
	product_id int not null,
	product_price int not null,
	counts int not null,
	primary key (user_id,product_id),
	foreign key (user_id) references users(id),
	foreign key (product_id) references products(id)
);

create table if not exists orders(
	user_id int not null,
	product_id int not null,
	`time` varchar(20) not null,
	order_status int not null,
	product_price int not null,
	counts int not null,
	primary key (user_id,product_id,`time`),
	foreign key (user_id) references users(id),
	foreign key (product_id) references products(id)
);

create table if not exists evaluation(
	user_id int not null,
	product_id int not null,
	`time` varchar(20) not null,
	content varchar(1000) not null,
	primary key (user_id,product_id,`time`),
	foreign key (user_id) references users(id),
	foreign key (product_id) references products(id)
);