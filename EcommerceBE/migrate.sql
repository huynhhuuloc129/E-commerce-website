USE sunny_cosmetic;

CREATE TABLE IF NOT EXISTS Brand (
    brandId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    name varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS Tag (
    tagId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    name varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS Component (
    componentId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    name varchar(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Category (
    catId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    name varchar(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Product (
    proId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    catId int NOT NULL,
    brandId int NOT NULL,
    name varchar(255) NOT NULL,
    description TEXT NOT NULL,
    unit varchar(255) NOT NULL,
    unitPrice int NOT NULL,
    quantityInStock int NOT NULL,
    guide TEXT NOT NULL,
    FOREIGN KEY (catId)
      REFERENCES Category (catId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (brandId)
      REFERENCES Brand (brandId)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Product_Tag (
    productTagId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    name varchar(255) NOT NULL,
    tagId int NOT NULL,
    productId int NOT NULL,
    FOREIGN KEY (tagId)
      REFERENCES Tag (tagId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (productId) 
      REFERENCES Product (proId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Product_Component (
    productComponentId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdAt Date NOT NULL,
    updatedAt Date NOT NULL,
    deletedAt Date,
    productId int NOT NULL,
    componentId int NOT NULL,
    percentage int NOT NULL,
    FOREIGN KEY (componentId)
      REFERENCES Component (componentId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (productId) 
      REFERENCES Product (proId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS Account (
    accountId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(255)  NOT NULL,
    birthDate date  NOT NULL,
    avatar LONGTEXT,
    billingAddress TEXT NOT NULL
);

-- INSERT INTO phongban (tenPhongBan) VALUES ('Hành chánh quản trị');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Tài chính kế toán');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Tổ chức cán bộ');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Công nghệ thông tin');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Kế hoạch tổng hợp');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Điều dưỡng');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Quản lý chất lượng - chỉ đạo tuyến');
-- INSERT INTO phongban (tenPhongBan) VALUES ('Vật tư thiết bị y tế');

