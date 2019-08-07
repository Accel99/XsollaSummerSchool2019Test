CREATE TABLE items (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE users (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	login VARCHAR(30) NOT NULL,
	password_hash VARCHAR(60) NOT NULL,
	balance INT NOT NULL
);

CREATE TABLE sales (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	seller_id INT NOT NULL,
	item_id INT NOT NULL,
	price INT NOT NULL,
	date_time TIMESTAMP(14) NOT NULL,
	CONSTRAINT fk_sales_seller_id__users_id FOREIGN KEY (seller_id) REFERENCES users (id),
	CONSTRAINT fk_sales_item_id__items_id FOREIGN KEY (item_id) REFERENCES items (id)
);

CREATE TABLE sold (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	seller_id INT NOT NULL,
	buyer_id INT NOT NULL,
	item_id INT NOT NULL,
	price INT NOT NULL,
	date_time TIMESTAMP(14) NOT NULL,
	CONSTRAINT fk_sold_seller_id__users_id FOREIGN KEY (seller_id) REFERENCES users (id),
	CONSTRAINT fk_sold_buyer_id__users_id FOREIGN KEY (buyer_id) REFERENCES users (id),
	CONSTRAINT fk_sold_item_id__items_id FOREIGN KEY (item_id) REFERENCES items (id)
);

CREATE INDEX sold_date_time_index ON sold (date_time);
CREATE INDEX sold_date_time_item_id_index ON sold (date_time, item_id);