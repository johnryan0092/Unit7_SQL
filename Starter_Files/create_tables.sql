create table card_holder (
	id int PRIMARY KEY,
	name VARCHAR(255));
	
	
create table credit_card (
	card VARCHAR(20) PRIMARY KEY,
	cardholder_id int NOT NULL,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id));
	
create table merchant_category (
	id int PRIMARY KEY,
	name VARCHAR(255))
	
create table merchant (
	id int PRIMARY KEY,
	name VARCHAR(255),
	id_merchant_category int,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id));
	
create table "transaction" (
	id int PRIMARY KEY,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant int,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id),
	FOREIGN KEY (card) REFERENCES credit_card(card))
	
