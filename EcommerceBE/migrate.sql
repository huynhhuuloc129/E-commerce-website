USE sunny_cosmetic;
SET SESSION group_concat_max_len = 1000000;

CREATE TABLE IF NOT EXISTS Image (
    imageId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    base64 LONGTEXT NOT NULL,
    belongId varchar(255) NOT NULL
);

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
    guide TEXT NOT NULL,
    maintain TEXT,
    note TEXT,
    FOREIGN KEY (catId)
      REFERENCES Category (catId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (brandId)
      REFERENCES Brand (brandId)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Type (
    typeId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    productId int NOT NULL,
    unitPrice int NOT NULL,
    quantityInStock int NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (productId)
      REFERENCES Product (proId)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Product_Tag (
    productTagId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

CREATE TABLE IF NOT EXISTS Orders (
    orderId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    accountId int NOT NULL,
    totalPrice int NOT NULL,
    shippingPrice int NOT NULL,
    shippingAddress varchar(255) NOT NULL,
    shippingType varchar(255) NOT NULL,
    shipped BOOLEAN NOT NULL,
    shippedDate DATETIME NOT NULL,
    shipmentTracking varchar(255) NOT NULL,
    paid boolean not null,
    FOREIGN KEY (accountId)
      REFERENCES Account (accountId)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SelectedProduct (
    selectedProductId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantitySelected int NOT NULL,
    sellingPrice int not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    proId int NOT NULL,
    orderId int,
    accountId int not null,
    typeId int NOT NULL,
    block Boolean not null,
    FOREIGN KEY (proId)
      REFERENCES Product (proId)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (accountId) 
      REFERENCES Account (accountId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (orderId) 
      REFERENCES orders (orderId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Review (
    reviewId int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    productId int NOT NULL,
    accountId int NOT NULL,
    content TEXT NOT NULL,
    star int not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (productId) 
      REFERENCES Product (proId) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (accountId) 
      REFERENCES Account (accountId) 
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

INSERT INTO Category (name, description) VALUES ('Dưỡng da', 'a');
INSERT INTO Category (name, description) VALUES ('Trang điểm', 'a');
INSERT INTO Category (name, description) VALUES ('chăm sóc, nhuộm tóc', 'a');

INSERT INTO Tag (name) VALUES ('tinh chất dưỡng da');
INSERT INTO Tag (name) VALUES ('son thỏi');
INSERT INTO Tag (name) VALUES ('thuốc nhuộm tóc vĩnh viễn');
INSERT INTO Tag (name) VALUES ('màu tóc sống động');
INSERT INTO Tag (name) VALUES ('phủ bạc cho tóc');
INSERT INTO Tag (name) VALUES ('màu nâu');
INSERT INTO Tag (name) VALUES ('tóc màu nâu sáng');
INSERT INTO Tag (name) VALUES ('nhuộm tóc balayage');
INSERT INTO Tag (name) VALUES ('tóc màu nâu ash brown');
INSERT INTO Tag (name) VALUES ('tóc nâu');
INSERT INTO Tag (name) VALUES ('kem nền');
INSERT INTO Tag (name) VALUES ('vẻ láng mịn');
INSERT INTO Tag (name) VALUES ('phấn nền dạng lỏng (kem nền)');
INSERT INTO Tag (name) VALUES ('màu be');
INSERT INTO Tag (name) VALUES ('trung bình');
INSERT INTO Tag (name) VALUES ('kem che khuyết điểm');
INSERT INTO Tag (name) VALUES ('trang điểm mịn lì');
INSERT INTO Tag (name) VALUES ('kem trang điểm');
INSERT INTO Tag (name) VALUES ('không gây dị ứng');
INSERT INTO Tag (name) VALUES ('trang điểm tự nhiên');
INSERT INTO Tag (name) VALUES ('phấn nền dạng nén');
INSERT INTO Tag (name) VALUES ('nhẹ');
INSERT INTO Tag (name) VALUES ('kem lót');
INSERT INTO Tag (name) VALUES ('trang điểm căng bóng');
INSERT INTO Tag (name) VALUES ('kem dưỡng ẩm dành cho mặt');
INSERT INTO Tag (name) VALUES ('chống lão hóa');
INSERT INTO Tag (name) VALUES ('da xỉn màu');
INSERT INTO Tag (name) VALUES ('gel');
INSERT INTO Tag (name) VALUES ('da khô');
INSERT INTO Tag (name) VALUES ('da thường');
INSERT INTO Tag (name) VALUES ('mặt nạ mặt');
INSERT INTO Tag (name) VALUES ('nếp nhăn sâu');
INSERT INTO Tag (name) VALUES ('da thiếu nước');
INSERT INTO Tag (name) VALUES ('độ săn chắc của da');
INSERT INTO Tag (name) VALUES ('cấp ẩm cho da');
INSERT INTO Tag (name) VALUES ('tinh chất serum');
INSERT INTO Tag (name) VALUES ('da lão hóa');
INSERT INTO Tag (name) VALUES ('kem dưỡng ban ngày');
INSERT INTO Tag (name) VALUES ('nước cân bằng da');
INSERT INTO Tag (name) VALUES ('kem dưỡng da ban đêm');
INSERT INTO Tag (name) VALUES ('da không đều màu');
INSERT INTO Tag (name) VALUES ('các khuyết điểm của da');
INSERT INTO Tag (name) VALUES ('đốm nâu');
INSERT INTO Tag (name) VALUES ('kem');
INSERT INTO Tag (name) VALUES ('da hỗn hợp');

INSERT INTO Brand (name) VALUES ('romand');
INSERT INTO Brand (name) VALUES ('merzy');
INSERT INTO Brand (name) VALUES ('FOIF');
INSERT INTO Brand (name) VALUES ('NUSE');
INSERT INTO Brand (name) VALUES ('Carenel');
INSERT INTO Brand (name) VALUES ('Lilybyred');

INSERT INTO Tag (name) VALUES ('Son môi');
INSERT INTO Tag (name) VALUES ('Son dưỡng có màu');
INSERT INTO Tag (name) VALUES ('làm mềm môi');
INSERT INTO Tag (name) VALUES ('Tint Lì');
INSERT INTO Tag (name) VALUES ('Son kem lì');
INSERT INTO Tag (name) VALUES ('bền màu');
INSERT INTO Tag (name) VALUES ('lâu trôi');
INSERT INTO Tag (name) VALUES ('Son Kem Siêu Lì');
INSERT INTO Tag (name) VALUES ('Mịn Môi');
INSERT INTO Tag (name) VALUES ('Son Tint Nước Siêu Lì');
INSERT INTO Tag (name) VALUES ('Kem Lì');
INSERT INTO Tag (name) VALUES ('Lên Màu Chuẩn');
INSERT INTO Tag (name) VALUES ('Siêu Mịn Môi');
INSERT INTO Tag (name) VALUES ('Mịn Mượt Nhẹ Môi');
INSERT INTO Tag (name) VALUES ('Son Bóng Pha Lê Căng Mọng');
INSERT INTO Tag (name) VALUES ('Son Tint Bóng Thuần Chay');
INSERT INTO Tag (name) VALUES ('Ẩm Mọng');
INSERT INTO Tag (name) VALUES ('Son Dưỡng Dạng Thỏi');
INSERT INTO Tag (name) VALUES ('Có Màu Thuần Chay');
INSERT INTO Tag (name) VALUES ('Dưỡng Ẩm Mềm Môi');
INSERT INTO Tag (name) VALUES ('Siêu Lì Cho Đôi Môi Căng Mọng');
INSERT INTO Tag (name) VALUES ('Son Kem Lì Hàn Quốc Thuần Chay');
INSERT INTO Tag (name) VALUES ('Mịn Mượt Lâu Trôi');
INSERT INTO Tag (name) VALUES ('Dưỡng Ẩm Cho Đôi Môi Căng Mọng');
INSERT INTO Tag (name) VALUES ('Căng Mọng Đôi Môi');
INSERT INTO Tag (name) VALUES ('Son Dưỡng Ẩm Có Màu Cho Môi Mềm Mịn');
INSERT INTO Tag (name) VALUES ('Nhung Lì');
INSERT INTO Tag (name) VALUES ('Thiết Kế 2 Đầu');
INSERT INTO Tag (name) VALUES ('Son Kem Lì Cực Nhẹ Môi');
INSERT INTO Tag (name) VALUES ('Son Kem Lì Hàn Quốc');
INSERT INTO Tag (name) VALUES ('Son Thỏi Lì');
INSERT INTO Tag (name) VALUES ('Mặt Nạ Ngủ Môi Hàn Quốc');
INSERT INTO Tag (name) VALUES ('Dưỡng Ẩm');
INSERT INTO Tag (name) VALUES ('Loại Bỏ Da Chết');
INSERT INTO Tag (name) VALUES ('Nước Tẩy Trang');
INSERT INTO Tag (name) VALUES ('Làm Sạch Tươi Mát');
INSERT INTO Tag (name) VALUES ('Dưỡng Ẩm Cho Da');
ALTER TABLE product AUTO_INCREMENT = 1
ALTER TABLE type AUTO_INCREMENT = 1
INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 21, 'Judydoll Watery Glow Lipstick','Son Dưỡng Có Màu Làm Mềm Môi Judydoll Watery Glow Lipstick là son dưỡng của thương
 hiệu Judydoll. Với khả năng cấp ẩm cho đôi môi mềm mại mà không gây tình trạng bết dính 
trên môi. Cùng với chất son mỏng nhẹ chỉ cần lướt nhẹ trên môi cùng bảng màu trong trẻo
, lên màu khá chuẩn.', 'Thỏi' , 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp
Để nơi khô ráo, thoáng mát
Đậy nắp kín sau khi sử dụng', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23, 'Romand Juicy Lasting Tint Starry Edition','Son Tint Lì Romand Juicy Lasting Tint Starry Edition Màu 23 Nucadamia - Màu đỏ nâu nude 
có chất son tint là cây son luôn dẫn đầu về lượt bán kể từ khi ra mắt tại Việt Nam. Vì thế 
Romand đã ra mắt phiên bản chỉ dành riêng cho fan Việt Nam với thiết kế những ngôi sao có 
màu son 23 đang tỏa sáng, rực rỡ cùng với điểm nhấn thân son mạ rose gold, thiết kế chưa 
từng có tại Romand.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp
Để nơi khô ráo, thoáng mát
Đậy nắp kín sau khi sử dụng', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất
Đậy nắp kín sau khi sử dụng để giữ cho son luôn tươi mới và tránh khô nứt
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da
Khi sử dụng son Romand Juicy Lasting Tint, hãy đảm bảo đậy nắp kín sau khi sử dụng
 để giữ cho son luôn tươi mới và tránh khô nứt.');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23, 'Romand Juicy Lasting Tint','Son Tint Lì Romand Juicy Lasting Tint là son tint thuộc thương hiệu Romand với chất son 
trong trẻo, tạo hiệu ứng căng mọng tự nhiên cho đôi môi, màu son duy trì trong nhiều giờ liền 
cho bạn cảm giác bờ môi sáng bóng, căng mọng và ngọt ngào.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp
Để nơi khô ráo, thoáng mát
Đậy nắp kín sau khi sử dụng', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất
Đậy nắp kín sau khi sử dụng để giữ cho son luôn tươi mới và tránh khô nứt
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da
Khi sử dụng son Romand Juicy Lasting Tint, hãy đảm bảo đậy nắp kín sau khi sử dụng
 để giữ cho son luôn tươi mới và tránh khô nứt.');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24, 'Merzy The First Velvet Tint','Son Kem Lì, Bền Màu, Lâu Trôi Merzy The First Velvet Tint là son kem lì đến từ thương hiệu 
Merzy. Phiên bản V6 Blue Dream có vỏ ngoài ảo diệu với hiệu ứng xanh dương - tím Hologram
 độc đáo. Với màu son đỏ gạch huyền thoại phù hợp với mọi tone da Việt. Có độ bám lâu trôi 
giữ màu suốt nhiều giờ mà không gây khô nứt khó chịu nhờ công nghệ cải tiến mới.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp
Để nơi khô ráo, thoáng mát
Đậy nắp kín sau khi sử dụng', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24, 'Merzy Noir In The Mellow Tint','Son Kem Siêu Lì, Mịn Môi Merzy Mellow Tint Red Edition là son kem lì đến từ thương hiệu Merzy 
là phiên bản mới của M13 - màu son đỏ trầm với ma lực thu hút ánh nhìn, màu son thể hiện một 
tinh thần mạnh mẽ, lôi cuốn đầy quyến rũ, là nữ hoàng của màu đỏ, màu son không thể thiếu 
trong tủ đồ makeup của bạn.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp
Để nơi khô ráo, thoáng mát
Đậy nắp kín sau khi sử dụng', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23, 'Romand Glasting Water Tint','Son Tint Nước Siêu Lì, Lâu Trôi Romand Glasting Water Tint là son tint lì của thương hiệu Romand
 có chất son tint bóng tự như một lớp màng nước lướt nhẹ trên môi, chứa nhiều dưỡng chất giúp 
nuôi dưỡng đôi môi, son lên môi nhẹ và mướt mịn, dễ tán đều cùng với bảng màu rực rỡ đa dạng
 mang đến cho bạn đôi môi căng mọng tràn đầy sức sống, tự tin cả ngày dài.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23, 'Romand Blur Fudge Tint','Son Kem Lì, Lên Màu Chuẩn, Mịn Môi Romand Blur Fudge Tint là son kem đến từ thương hiệu 
Romand có chất son fudge mướt mịn, dễ dàng lướt nhẹ trên đôi môi, mang đến cho bạn đôi môi mịn
 lì rạng rỡ đầy thu hút.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24, 'Merzy Soft Touch Lip Tint','Son Kem Siêu Lì, Siêu Mịn Môi Merzy Soft Touch Lip Tint là son kem lì đến từ thương hiệu Merzy với 
chất son tint nhung lì chứa công thức đàn hồi tạo kết cấu lì bên ngoài và độ ẩm bên trong, giúp bổ 
sung độ ẩm cho môi, giữ cho đôi môi luôn được căng mướt và dưỡng ẩm cho môi hiệu quả, mang 
đến cho bạn đôi môi mịn lì tự nhiên, mềm mại lâu trôi suốt cả ngày dài.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24, 'Merzy Cyber Mellow Tint','Son Kem Lì, Mịn Mượt Nhẹ Môi, Bền Màu Merzy Cyber Mellow Tint là son kem lì đến từ thương hiệu 
Merzy với thiết kế tinh tế, hiện đại, đậm chất thời trang, chất son kem mịn lì nhẹ môi, bền màu lâu trôi, 
độ che phủ hoàn hảo cùng bảng màu đa dạng mang lại đôi môi căng mọng, quyến rũ.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24, 'Merzy Bisous Glowy Gel Tint','Son Bóng Pha Lê Căng Mọng, Bền Màu Merzy Bisous Glowy Gel Tint là dòng son bóng cải tiến mới 
từ thương hiệu Merzy. Bảng màu son MLBB tone nhẹ nhàng, trendy và phù hợp với mọi layout 
makeup tiểu thư, trong trẻo, nữ tính đến trầm ấm, quyến rũ. Có thiết kế vỏ son tone hồng ngọt 
ngào, nữ tính rất thích hợp làm quà tặng cho các bạn gái. ', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 25, 'FOIF Juicy Fit Tint','Son Tint Bóng Thuần Chay, Ẩm Mọng, Bền Màu FOIF Juicy Fit Tint là son tint của thương hiệu FOIF 
tân binh khủng long của nhà Merzy. Son bóng thế hệ mới với chất son mỏng nhẹ có thành phần cấp 
ẩm và khóa ẩm cho môi, mà sản phẩm còn được làm hoàn toàn từ thành phần Vegan lành tính mang 
đến cho bạn đôi môi ẩm mọng và khỏe mạnh. Cùng với bảng màu trendy hứa hẹn sẽ khuấy đảo 
giới trẻ làm đẹp. ', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Glasting Melting Balm', 'Son Dưỡng Thuần Chay Romand Glasting Melting Balm là son thỏi màu có dưỡng đến từ thương hiệu 
Romand với tinh chất dầu thực vật thuần chay cùng chất son siêu nhẹ môi có độ dưỡng cao, giúp 
dưỡng ẩm cho đôi môi mềm mại, căng bóng tự nhiên trong thời gian dài.', 'Thỏi', 'Sử dụng trước và sau khi thoa son màu để dưỡng đôi môi ẩm mượt và mịn màng.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn son dưỡng an toàn, lành tính, ưu tiên thành phần từ thiên nhiên
Không sử dụng son dưỡng giả, hết hạn sử dụng
Không lạm dụng son dưỡng môi');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Dewyful Water Tint', 'Son Tint Bóng, Siêu Lì Romand Dewyful Water Tint 5g là son tint lì đến từ thương hiệu Romand với chất 
son tint lì giúp môi căng mọng, mịn mượt son lên môi nhẹ và mướt mịn, dễ tán đều và bền màu, lâu trôi 
cùng với bảng màu rực rỡ đa dạng mang đến cho bạn đôi môi căng mọng tràn đầy sức sống, tự tin 
cả ngày dài.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24,'Merzy Academia Mellow Tint', 'Son Kem Siêu Lì, Lâu Trôi, Lên Màu Chuẩn Merzy Academia Mellow Tint là son kem đến từ thương hiệu 
Merzy có kết cấu chất son kem nhẹ tênh, lướt trên môi mang lại cảm giác mềm mịn, khả năng bám 
màu cao cùng độ lên màu chuẩn mang lại đôi môi mịn như bơ, bền màu và lâu trôi suốt cả ngày.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 25,'FOIF Daily Velvet Tint', 'Son Kem Lì Hàn Quốc Thuần Chay, Mịn Mượt Lâu Trôi FOIF Daily Velvet Tint là son kem lì thuộc dòng 
Velvet Tint của thương hiệu FOIF - tân binh khủng long của nhà Merzy. Sản phẩm nổi bật với chất son 
mịn môi, lên màu chuẩn cùng bảng màu đa dạng thời thượng, giúp đôi môi bạn luôn xinh đẹp suốt 
cả ngày, hứa hẹn sẽ khuấy đảo giới trẻ làm đẹp. ','Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh để sản phẩm tiếp xúc trực tiếp 
với ánh sáng, những nơi có nhiệt độ 
quá thấp, hoặc nhiệt độ quá cao', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24,'Merzy Dreamy Late Night Mellow Tint', 'Son Kem Lì Merzy Dreamy Late Night Mellow Tint 4g là son kem lì thuộc dòng Mellow tint của thương 
hiệu Merzy trở lại với một "vỏ ngoài" mới mẻ mang đậm cá tính của riêng bạn, chất son mịn mượt nhẹ 
tênh cùng độ bền màu cao và bảng màu mang sắc màu của màn đêm êm dịu, tạo hiệu ứng giúp đôi 
môi bạn luôn rạng rỡ căng đầy và bền màu kể cả giữa màn đêm mơ màng ','Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 29,'Lilybyred Glassy Layer Fixing Tint', 'Son Tint Lì, Dưỡng Ẩm Cho Đôi Môi Lilybyred Glassy Layer Fixing Tint là son tint đến từ thương hiệu 
Lilybyred giúp tạo hiệu ứng đôi môi căng bóng rạng rỡ những vẫn trong trẻo cùng độ bám màu tốt và 
bảng màu thời thượng mang đến cho bạn cảm giác đôi môi luôn căng mọng tràn đầy sức sống và tươi 
trẻ.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn son dưỡng an toàn, lành tính, ưu tiên thành phần từ thiên nhiên
Không sử dụng son dưỡng giả, hết hạn sử dụng
Không lạm dụng son dưỡng môi');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Glasting Water Gloss', 'Son Tint Bóng Hàn Quốc Lâu Trôi, Căng Mọng Đôi Môi Romand Glasting Water Gloss là son tint của 
thương hiệu Romand có kết cấu trong suốt chứa thành phần dưỡng ẩm, mướt môi không gây bết dính 
cùng màu sắc bắt sáng rạng rỡ, lung linh, tạo hiệu ứng độ bóng mang đến cho bạn đôi môi căng mọng, 
đầy đặn quyến rũ đến không ngờ.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 24,'Merzy Siren Melting Color Lip Balm', 'Son Dưỡng Ẩm Có Màu Cho Môi Mềm Mịn, Căng Mọng Merzy Siren Melting Color Lip Balm là son thỏi 
dưỡng có màu nằm trong bộ sưu tập Merzy Siren Collection lấy cảm hứng từ vẻ đẹp quyến rũ kiêu sa 
của mỹ nhân ngư. Có chất son mềm mịn như "tan chảy" trên môi, giúp dưỡng ẩm trong nhiều giờ liền 
với các tone màu MLBB nhẹ nhàng tươi tắn, dễ dàng sử dụng hằng ngày.', 'Thỏi', 'Sử dụng trước và sau khi thoa son màu để dưỡng đôi môi ẩm mượt và mịn màng.
', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn son dưỡng an toàn, lành tính, ưu tiên thành phần từ thiên nhiên
Không sử dụng son dưỡng giả, hết hạn sử dụng
Không lạm dụng son dưỡng môi
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da…');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Glasting Melting Balm', 'Son Dưỡng Thuần Chay Romand Glasting Melting Balm là son thỏi màu có dưỡng đến từ thương hiệu 
Romand với tinh chất dầu thực vật thuần chay cùng chất son siêu nhẹ môi có độ dưỡng cao, giúp 
dưỡng ẩm cho đôi môi mềm mại, căng mọng tự nhiên trong thời gian dài.', 'Thỏi', 'Sử dụng trước và sau khi thoa son màu để dưỡng đôi môi ẩm mượt và mịn màng.
', 'Đậy nắp kín sau khi sử dụng để 
tránh bụi bẩn và khô son.
Để son ở nơi khô ráo, thoáng mát,
 tránh ánh nắng trực tiếp và nhiệt độ cao.
Không sử dụng son quá lâu, thay đổi
 son mới sau hạn sử dụng.', 'Chọn son dưỡng an toàn, lành tính, ưu tiên thành phần từ thiên nhiên
Không sử dụng son dưỡng giả, hết hạn sử dụng
Không lạm dụng son dưỡng môi
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da…');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Lip Mate Pencil', 'Chì Kẻ Viền Môi Nhung Lì, Lâu Trôi, Thiết Kế 2 Đầu Romand Lip Mate Pencil 0.5g là chì kẻ môi giúp định 
hình và giúp đôi môi thêm phần sắc nét đến từ thương hiệu Romand với kết cấu chì mềm mịn cho đường 
viền tinh tế, sắc nét. Định hình môi khuôn môi dễ tô son, hỗ trợ son môi lên màu chuẩn, lâu trôi.', 'Thỏi', 'Dùng chì kẻ môi kẻ viền môi, rồi lấy đầu cọ tán dần từ viền môi vào lòng môi. Sau đó tô son, son của 
bạn sẽ bền màu hơn.', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', 'Bảo quản đúng cách
Kiểm tra hạn sử dụng
Tránh tiếp xúc với mắt và miệng');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Zero Velvet Tint', 'Son Kem Lì Cực Nhẹ Môi Romand Zero Velvet Tint là son kem lì của thương hiệu Romand với kết cấu 
velvet xốp mềm cùng bảng màu đa dạng, dễ dùng cho đôi môi lên màu chuẩn, mịn mượt, nổi bật dù 
bạn ở bất cứ đâu.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Milk Tea Velvet Tint', 'Son Kem Lì Hàn Quốc Mịn Mượt Như Nhung Romand Milk Tea Velvet Tint là son kem lì của thương hiệu 
Romand có chất son velvet mịn mượt lướt nhẹ trên môi, chứa công thức blur cover bao bọc đôi môi mềm 
mại cùng độ lên màu chuẩn, bảng màu son có những tông màu trà sữa ngọt ngào, mùi thơm dịu nhẹ cho 
bạn đôi môi xinh xắn và rạng rỡ, thu hút mọi ánh nhìn.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 23,'Romand Zero Matte Lipstick', 'Son Thỏi Lì, Lên Màu Siêu Xinh Romand Zero Matte Lipstick - Shell Beach Nude Collection là son thỏi nằm 
trong phiên bản Shell Beach Nude Collection mới của thương hiệu Romand được cải tiến về thiết kế lẫn
 chất son mềm mịn, hoàn hảo và đẹp mắt hơn, cho bạn đôi môi mịn mượt mờ lì tràn đầy sức sống.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất
Đậy nắp kín sau khi sử dụng để giữ cho son luôn tươi mới và tránh khô nứt
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 26,'Nuse Mousse Liptual', 'Son Kem Lì, Mịn Mượt Thuần Chay Nuse Mousse Liptual 4.5g là son bóng đến từ thương hiệu Nuse  
"em gái của Romand". Với chất son mịn lì, nhẹ môi, che phủ rãnh môi tốt, cùng với thành phần dưỡng ẩm 
cao giúp giữ cân bằng độ ẩm, cấp ẩm cho môi luôn mịn màng, quyến rũ.', 'Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất
Đậy nắp kín sau khi sử dụng để giữ cho son luôn tươi mới và tránh khô nứt
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 27,'Carenel Lip Night Mask', 'Mặt Nạ Ngủ Môi Hàn Quốc Dưỡng Ẩm, Loại Bỏ Da Chết Cho Môi Carenel Lip Night Mask là sản phẩm 
dưỡng môi đến từ thương hiệu Carenel với chiết xuất Berry và chanh giúp nhẹ nhàng loại bỏ tế bào chết, 
dưỡng ẩm và cung cấp vitamin cho môi, cải thiện tình trạng môi khô nứt nẻ, mang lại đôi môi căng mọng,
 ẩm mịn.', 'Mặt nạ', 'Sử dụng vào buổi tối trước khi đi ngủ (3-4 lần 1 tuần). Lấy một lượng vừa đủ thoa đều nhẹ nhàng lên môi. 
Sáng hôm sau lau sạch bằng bông gòn hay khăn giấy mềm. ', 'Tránh ánh nắng trực tiếp.
Để nơi khô ráo, thoáng mát.
Đậy nắp kín sau khi sử dụng.', '');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 26,'Nuse Color Care Lipbalm', 'Son Dưỡng Có Màu Thuần Chay Nuse Color Care Lipbalm là son dưỡng có màu đến từ thương hiệu 
Nuse "em gái của Romand". Chất son dưỡng siêu nhẹ môi có độ dưỡng cao cùng độ bóng ẩm mịn, 
lướt mịn trên môi. Làm cải thiện các nếp nhăn và tế bào chết trên môi. Cùng với bảng màu trong trẻo, 
tự nhiên mang sắc hồng cho môi luôn tươi tắn, căng bóng tự nhiên trong thời gian dài.', 'Thỏi', 'Sử dụng trước và sau khi thoa son màu để dưỡng đôi môi ẩm mượt và mịn màng.', 'Tránh để sản phẩm tiếp xúc trực tiếp 
với ánh sáng, những nơi có nhiệt độ 
quá thấp, hoặc nhiệt độ quá cao', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất
Đậy nắp kín sau khi sử dụng để giữ cho son luôn tươi mới và tránh khô nứt
Màu sắc có thể khác nhau tùy thuộc vào ánh sáng, độ phân giải màn hình và sắc tố da');

INSERT INTO Product (catId, brandId, name, description, unit, guide, maintain, note) VALUES (2, 27,'Merzy Bite The Beat Mellow Tint', 'Son Kem Lì, Siêu Mịn Merzy Bite The Beat Mellow Tint 4g là son kem lì thuộc thương hiệu Merzy với chất
 son được cải tiến rõ rệt so với dòng cũ khi kết cấu có dạng kem xốp mịn, lướt nhẹ trên môi, cảm giác 
môi sẽ mịn mượt ngay khi chạm son. Khả năng lên màu cực kỳ chuẩn, cho bạn đôi môi xinh xắn và 
quyến rũ, thu hút.','Thỏi', 'Bước 1: Bạn nên dưỡng ẩm và làm mềm môi trước khi thoa son
Bước 2: Sử dụng đầu cọ thoa son lên môi theo hình dáng và khuôn môi của bạn. Bắt đầu từ giữa mô
i và thoa ra hai bên. Nếu muốn màu sắc tươi sáng hơn, bạn có thể dặm thêm một lớp son nữa.
Bước 3: Dùng đầu ngón tay hoặc cọ nhỏ nhẹ nhàng tán đều son trên môi để tạo hiệu ứng mờ và đều 
màu.
Bước 4: Nếu cảm thấy môi khô hoặc cần thêm độ bóng, bạn có thể dặm thêm một lớp son mỏng phủ lên
 trên.', 'Tránh để sản phẩm tiếp xúc trực tiếp 
với ánh sáng, những nơi có nhiệt độ 
quá thấp, hoặc nhiệt độ quá cao', 'Chọn màu son hợp với tông da
Không sử dụng son giả, son đã hết hạn
Thường xuyên tẩy tế bào chết cho môi để màu son lên chuẩn nhất');



-- 1
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('Nude Pink - Hồng tự nhiên', 1, 202000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('Jelly - Cam sữa ngọt ngào', 1, 202000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('Amber - Hồng trà hổ phách', 1, 202000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('Hawthorn - Đỏ ánh cam trẻ trung', 1, 202000, 100);

-- 2
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NUCADAMIA', 2, 169000, 100);

-- 3
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FIG FIG', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JUJUBE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('APPLE BROWN', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LITCHI', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NUDY PEANUT', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PINK PUMKIN', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CHERRY BOMB', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('EAT DOTORI', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BERRY SHOT', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FUNKY MELON', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CORNI SODA', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PLUME COKE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MULLED PEACH', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ALMOND ROSE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DARK COCONUT', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DEEP SANGRIA', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('POMELO SKIN', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NUCADAMIA', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PEELING ANGDOO', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BARE GRAPE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VERY BERRY PINK', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PINK POPSICLE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BARE FIG', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PAPAYA CHAM', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BARE APRICOT', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BARE BERRY SMOOTHIE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BARE VINE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MELLOW PEAR', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BREEZE FIG', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ODD GRAPE', 3, 144000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PEACH HONEY B', 3, 144000, 100);

-- 4
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('V6 GREEN', 4, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('V6 GREEN HOLIDAY', 4, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('V6 SIREN', 4, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('V6 SIREN HOLIDAY', 4, 149000, 100);

-- 5
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M2', 5, 142000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M4', 5, 142000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M11', 5, 142000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M13', 5, 142000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M17', 5, 142000, 100);

-- 6
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ĐỎ THẪM', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ĐỎ GẠCH', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ĐỎ NÂU', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CÁNH HỒNG KHÔ', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('HỒNG NÂU TRẦM', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('HỒNG MAUVE', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CAM NUDE', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('HỒNG ROSE', 6, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NÂU ĐỎ ĐẤT', 6, 169000, 100);

-- 7
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('01', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('02', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('03', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('04', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('05', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('06', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('07', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('08', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('09', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('10', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('11', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('12', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('13', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('14', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('15', 7, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('16', 7, 174000, 100);

-- 8
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL1', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL2', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL3', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL5', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL6', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL7', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL8', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL9', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL10', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL11', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL12', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL4', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL13', 8, 249000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SL14', 8, 249000, 100);

-- 9
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM1', 9, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM2', 9, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM3', 9, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM4', 9, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM5', 9, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CM6', 9, 159000, 100);

-- 10
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT0', 10, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT1', 10, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT2', 10, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT3', 10, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT4', 10, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GT5', 10, 169000, 100);

-- 11
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT1', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT2', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT3', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT4', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT5', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT6', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT7', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT8', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT9', 11, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JT10', 11, 119000, 100);

-- 12
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('COCO NUDE', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LOVEY PINK', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SORBET BALM', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('HIPPIE BERRY', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NOUGAT SAND', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('KAYA FIG', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MAUVE WHIP', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CORALIA', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PEONIES', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NU BEIGE', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BUFFY CORAL', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VEILED ROSE', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SCOTCH NUDE', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DEAR APPLE', 12, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PECAN BREW', 12, 189000, 100);

-- 13
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('01', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('02', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('03', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('04', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('05', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('07', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('08', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('12', 13, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('13', 13, 174000, 100);

-- 14
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM1', 14, 139000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM2', 14, 139000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM3', 14, 139000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM4', 14, 139000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM5', 14, 139000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AM6', 14, 139000, 100);

-- 15
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VT1', 15, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VT2', 15, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VT3', 15, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VT4', 15, 119000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VT5', 15, 119000, 100);

-- 16
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M11', 16, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M12', 16, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M13', 16, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M14', 16, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M15', 16, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M17', 16, 159000, 100);


-- 17
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('01', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('02', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('04', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('07', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('08', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('09', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('12', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('13', 17, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('16', 17, 129000, 100);

-- 18
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('METEOR TRACK - KHÔNG MÀU', 18, 169000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SANHO CRUSH - HỒNG SAN HÔ', 18, 169000, 100);

-- 19
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LB1', 19, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LB2', 19, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LB3', 19, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LB4', 19, 189000, 100);

-- 20
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NU BEIGE', 20, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BUFFY CORAL', 20, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VEILED ROSE', 20, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SCOTCH NUDE', 20, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DEAR APPLE', 20, 189000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PECAN BREW', 20, 189000, 100);

-- 21
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('TENDERLY PEACH', 21, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DOVEY PINK', 21, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('KAYA BEIGE', 21, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FIG BREEZE', 21, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('TAUPEY SHADE', 21, 174000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('UNDER CHIL', 21, 174000, 100);

-- 22
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JOYFUL', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PECAN TARTE', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BURNT HEART', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('WITTY', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DEEPSOUL', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FIZZ', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ICY', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ANNE SHIRLEY', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RUSK RUSK', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BURNY NUDE', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('TOAST NUDE', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PETAL TASSEL', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('EARL GREY SHAWL', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BERRY KNIT', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VILLAIN VEST', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('GRAIN NUDE', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VINTAGE TAUPE', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FADE RED', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('NERD PINK', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PEPPER CHERRY', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('OAK WOOD', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SPICY NUT', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MAUVE NOIR', 22, 149000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DEEP PORT', 22, 149000, 100);

-- 23
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('VANILLA TEA', 23, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('JASMINE TEA', 23, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ROSE TEA', 23, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('EARL GREY TEA', 23, 129000, 100);

-- 24
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DUSTY PINK', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ALL THAT JAZZ', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SIHOUETTE', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BEFORE SUNSET', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('EVENING', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AWESOME (NUDE)', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ENVY ME (NUDE)', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SUNLIGHT', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SOMETHING', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RED CARPET', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RED HEAT', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('TANNING RED', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RED SURFER', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RED DIVE', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ADORABLE (NUDE)', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SHELL NUDE (NUDE)', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('PINK SAND (NUDE)', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SWEET P', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MIDNIGHT', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DAZZLE RED', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SMOKED BEIGE', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MAUVE BEANS', 24, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('RUDDY NUDE', 24, 129000, 100);

-- 25
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('DUSTY PINK', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ALL THAT JAZZ', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SIHOUETTE', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BEFORE SUNSET', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('EVENING', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('AWESOME (NUDE)', 25, 129000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('ENVY ME (NUDE)', 25, 129000, 100);

-- 26
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('LIME', 26, 57000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('BERRY', 26, 57000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('POMEGRANATE', 26, 57000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('APRICOT', 26, 57000, 100);

-- 27
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('FRENCH NUDE', 27, 199000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('HEY WOODY', 27, 199000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('SO RED', 27, 199000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('CALMING CORAL', 27, 199000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('MAUVE MOVE', 27, 199000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('WE ARE NUSE', 27, 199000, 100);

-- 28
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M1', 28, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M2', 28, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M3', 28, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M4', 28, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M5', 28, 159000, 100);
INSERT INTO Type (name, productId, unitPrice, quantityInStock) VALUES ('M6', 28, 159000, 100);


INSERT INTO Product_Tag (tagId, productId) VALUES (52, 1);
INSERT INTO Product_Tag (tagId, productId) VALUES (53, 1);
INSERT INTO Product_Tag (tagId, productId) VALUES (54, 1);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 2);
INSERT INTO Product_Tag (tagId, productId) VALUES (55, 2);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 3);
INSERT INTO Product_Tag (tagId, productId) VALUES (55, 3);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 4);
INSERT INTO Product_Tag (tagId, productId) VALUES (56, 4);
INSERT INTO Product_Tag (tagId, productId) VALUES (57, 4);
INSERT INTO Product_Tag (tagId, productId) VALUES (58, 4);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 5);
INSERT INTO Product_Tag (tagId, productId) VALUES (59, 5);
INSERT INTO Product_Tag (tagId, productId) VALUES (60, 5);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 6);
INSERT INTO Product_Tag (tagId, productId) VALUES (61, 6);
INSERT INTO Product_Tag (tagId, productId) VALUES (62, 6);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 7);
INSERT INTO Product_Tag (tagId, productId) VALUES (56, 7);
INSERT INTO Product_Tag (tagId, productId) VALUES (63, 7);
INSERT INTO Product_Tag (tagId, productId) VALUES (60, 7);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 8);
INSERT INTO Product_Tag (tagId, productId) VALUES (56, 8);
INSERT INTO Product_Tag (tagId, productId) VALUES (60, 8);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 9);
INSERT INTO Product_Tag (tagId, productId) VALUES (56, 9);
INSERT INTO Product_Tag (tagId, productId) VALUES (65, 9);
INSERT INTO Product_Tag (tagId, productId) VALUES (57, 9);


INSERT INTO Product_Tag (tagId, productId) VALUES (52, 10);
INSERT INTO Product_Tag (tagId, productId) VALUES (66, 10);
INSERT INTO Product_Tag (tagId, productId) VALUES (57, 10);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 11);
INSERT INTO Product_Tag (tagId, productId) VALUES (67, 11);
INSERT INTO Product_Tag (tagId, productId) VALUES (68, 11);
INSERT INTO Product_Tag (tagId, productId) VALUES (57, 11);
INSERT INTO Product_Tag (tagId, productId) VALUES (70, 11);


INSERT INTO Product_Tag (tagId, productId) VALUES (52, 12);
INSERT INTO Product_Tag (tagId, productId) VALUES (69, 12);
INSERT INTO Product_Tag (tagId, productId) VALUES (70, 12);
INSERT INTO Product_Tag (tagId, productId) VALUES (71, 12);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 13);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 13);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 13);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 13);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 14);
INSERT INTO Product_Tag (tagId, productId) VALUES (55, 14);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 15);
INSERT INTO Product_Tag (tagId, productId) VALUES (56, 15);
INSERT INTO Product_Tag (tagId, productId) VALUES (60, 15);
INSERT INTO Product_Tag (tagId, productId) VALUES (58, 15);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 16);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 16);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 16);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 16);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 17);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 17);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 17);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 17);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 18);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 18);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 18);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 18);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 19);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 19);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 19);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 19);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 20);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 20);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 20);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 20);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 21);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 21);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 21);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 21);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 22);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 22);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 22);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 22);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 23);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 23);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 23);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 23);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 24);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 24);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 24);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 24);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 25);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 25);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 25);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 25);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 26);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 26);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 26);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 26);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 27);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 27);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 27);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 27);

INSERT INTO Product_Tag (tagId, productId) VALUES (52, 28);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 28);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 28);
INSERT INTO Product_Tag (tagId, productId) VALUES (, 28);

INSERT INTO Review (productId, accountId, content, star) VALUES (2, 1, '"Sản phẩm son môi này thật sự tuyệt vời! Chất son mềm mượt, lên màu chuẩn ngay từ lần thoa đầu tiên và không gây khô môi. Đặc biệt, son giữ màu lâu, giúp tôi tự tin suốt cả ngày mà không cần dặm lại. Mùi hương dịu nhẹ cũng là một điểm cộng lớn, khiến tôi cảm thấy dễ chịu mỗi khi sử dụng. Thiết kế sang trọng và tiện dụng, rất phù hợp để mang theo bên mình. Đây chắc chắn sẽ là lựa chọn yêu thích của tôi trong thời gian dài!', 5);


INSERT INTO Review (productId, accountId, content, star) VALUES (2, 2, '"Sản phẩm son môi này thật sự tuyệt vời! Chất son mềm mượt, lên màu chuẩn ngay từ lần thoa đầu tiên và không gây khô môi. Đặc biệt, son giữ màu lâu, giúp tôi tự tin suốt cả ngày mà không cần dặm lại. Mùi hương dịu nhẹ cũng là một điểm cộng lớn, khiến tôi cảm thấy dễ chịu mỗi khi sử dụng. Thiết kế sang trọng và tiện dụng, rất phù hợp để mang theo bên mình. Đây chắc chắn sẽ là lựa chọn yêu thích của tôi trong thời gian dài!', 4);

INSERT INTO SelectedProduct() VALUES() ;

INSERT INTO Brand (name) VALUES ('Ôliv');
INSERT INTO Brand (name) VALUES ('Nguyên Xuân');
INSERT INTO Brand (name) VALUES ('Sunsilk');
INSERT INTO Brand (name) VALUES ('Purité');
INSERT INTO Brand (name) VALUES ('Fresh');
INSERT INTO Brand (name) VALUES ('Dove');
INSERT INTO Brand (name) VALUES ('Pantene');
INSERT INTO Brand (name) VALUES ('Tsubaki');
INSERT INTO Brand (name) VALUES ('Lifebuoy');
 INSERT INTO Brand (name) VALUES ('Romano');

 INSERT INTO Brand (name) VALUES ('Bioré');
 INSERT INTO Brand (name) VALUES ('Oxy');
 INSERT INTO Brand (name) VALUES ('Hada Labo');
 INSERT INTO Brand (name) VALUES ('Hazeline');

