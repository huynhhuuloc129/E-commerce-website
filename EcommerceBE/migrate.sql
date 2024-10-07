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
    productId int NOT NULL,
    unitPrice int NOT NULL,
    quantityInStock int NOT NULL,
    FOREIGN KEY (productId)
      REFERENCES Product (productId)
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










