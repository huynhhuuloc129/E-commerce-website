USE sunny_cosmetic;

CREATE TABLE IF NOT EXISTS Brand (
    brandId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(255) NOT NULL,
    logo LONGTEXT
);
CREATE TABLE IF NOT EXISTS Tag (
    tagId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS Component (
    componentId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Category (
    catId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Product (
    proId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

CREATE TABLE IF NOT EXISTS ShoppingCart (
    shoppingCartId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    accountId int NOT NULL,
    FOREIGN KEY (accountId) 
      REFERENCES Account (accountId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Review (
    reviewId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    proId int NOT NULL,
    accountId int NOT NULL,
    username varchar(255) NOT NULL,
    content varchar(255) NOT NULL,
    star int NOT NULL,
    FOREIGN KEY (proId)
      REFERENCES Product (proId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (accountId) 
      REFERENCES Account (accountId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SelectedProduct (
    selectedProductId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    proId int NOT NULL,
    shoppingCartId int NOT NULL,
    orderId int NOT NULL,
    FOREIGN KEY (proId)
      REFERENCES Product (proId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (shoppingCartId) 
      REFERENCES shoppingCart (shoppingCartId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (orderId) 
      REFERENCES order (orderId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Payment (
    paymentId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    shipmentType int NOT NULL,
    total int NOT NULL,
    details varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Order (
    orderId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    accountId int NOT NULL,
    shipmentId int NOT NULL,
    totalPrice int NOT NULL,
    shippingPrice int NOT NULL,
    orderDate DATETIME NOT NULL,
    paymentId int NOT NULL,
    FOREIGN KEY (accountId)
      REFERENCES Account (accountId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (shipmentId) 
      REFERENCES Shipment (shipmentId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (paymentId)
      REFERENCES Payment (paymentId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Shipment (
    shipmentId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    shippingAddress varchar(255) NOT NULL,
    shippingType varchar(255) NOT NULL,
    shipped BOOLEAN NOT NULL,
    shippedDate DATETIME NOT NULL,
    shipmentTracking varchar(255) NOT NULL,
    orderId int NOT NULL,
    FOREIGN KEY (orderId) 
      REFERENCES Order (orderId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

INSERT INTO Brand (name) VALUES ('acnes'); 
INSERT INTO Brand (name) VALUES ('cerave');
INSERT INTO Brand (name) VALUES ("L'Oreal Paris");
INSERT INTO Brand (name) VALUES ('simple');
INSERT INTO Brand (name) VALUES ('baby bright');
INSERT INTO Brand (name) VALUES ('Bio essence');
INSERT INTO Brand (name) VALUES ('browit');
INSERT INTO Brand (name) VALUES ('cathy doll');
INSERT INTO Brand (name) VALUES ('cocoon');
INSERT INTO Brand (name) VALUES ('colorkey');
INSERT INTO Brand (name) VALUES ('cetaphill');
INSERT INTO Brand (name) VALUES ('dabo');
INSERT INTO Brand (name) VALUES ('focallure');
INSERT INTO Brand (name) VALUES ('garnier');
INSERT INTO Brand (name) VALUES ('vaseline');
INSERT INTO Brand (name) VALUES ('the perfect diary');
INSERT INTO Brand (name) VALUES ('nivea');
INSERT INTO Brand (name) VALUES ('maybelline');
INSERT INTO Brand (name) VALUES ('la roche-posay');
INSERT INTO Brand (name) VALUES ('lemonade');
INSERT INTO Brand (name) VALUES ('judydoll');
INSERT INTO Brand (name) VALUES ('senka');

















