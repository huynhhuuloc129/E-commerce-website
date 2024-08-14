USE bv;

CREATE TABLE IF NOT EXISTS PhongBan (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tenPhongBan varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS DonViBanHang (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ten varchar(255),
    maSoThue varchar(255),
    diaChi varchar(1000),
    sdt varchar(255),
    email varchar(255),
    taiKhoan varchar(1000)
);
CREATE TABLE IF NOT EXISTS NguoiDung (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    taiKhoan varchar(255) NOT NULL,
    matKhau TEXT NOT NULL,
    hoTen varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    sdt varchar(255),
    ngaySinh date,
    avatar LONGTEXT,
    vaiTro varchar(255) NOT NULL,
    idPhongBan int,
    maNhanVien varchar(45),
    chucVu varchar(255)
);



CREATE TABLE IF NOT EXISTS LoaiTaiSan (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ten varchar(255) not null
);

CREATE TABLE IF NOT EXISTS TaiSan (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idLoaiTaiSan int not null,
    ten varchar(255) NOT NULL,
    soLo varchar(255) NOT NULL,
    ngayNhap date NOT NULL,
    hsd date not null,
    donViTinh varchar(255) NOT NULL,
    soluong int NOT NULL,
    donGia int not null,
    idPhongBan int not null,
    FOREIGN KEY (idPhongBan)
      REFERENCES PhongBan (id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
     FOREIGN KEY (idLoaiTaiSan) 
      REFERENCES LoaiTaiSan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PhieuXuat (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ngayTao date not null,
    idTaiSan int NOT NULL,
    idPhongBan int NOT NULL,
    soLuong int NOT NULL,
    FOREIGN KEY (idTaiSan) 
      REFERENCES TaiSan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (idPhongBan) 
      REFERENCES PhongBan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PhieuSua (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ngayTao date not null,
    idTaiSan int NOT NULL,
    idPhongBan int NOT NULL,
    tinhTrang varchar(500) NOT NULL,
    daSua tinyint default 0,
    FOREIGN KEY (idTaiSan) 
      REFERENCES TaiSan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (idPhongBan) 
      REFERENCES PhongBan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PhieuNhap (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idTaiSan int NOT NULL,
    idDonViBanHang int NOT NULL,
    ngayTao date not null,
    FOREIGN KEY (idTaiSan) 
      REFERENCES TaiSan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    FOREIGN KEY (idDonViBanHang) 
      REFERENCES DonViBanHang (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
    donViMua varchar(255),
    maSoThue varchar(255),
    diaChi varchar(255),
    soLuong int not null,
    donGia FLOAT not null,
    thanhTien FLOAT not null,
    tienThue FLOAT not null,
    tienThanhToan FLOAT  not null,
    hinhThucThanhToan varchar(255) not null,
    donViTienTe varchar(255) not null
);

CREATE TABLE IF NOT EXISTS CauHinhThongSo (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cpu varchar(255),
    ram varchar(255),
    hdd int,
    ssd int,
    cardDoHoa varchar(255),
    manHinh varchar(255),
    idTaiSan int NOT NULL,
    FOREIGN KEY (idTaiSan) 
      REFERENCES TaiSan (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ThietBiThayThe (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ten varchar(255) NOT NULL,
    soLuong int NOT NULL
);


CREATE TABLE IF NOT EXISTS PhieuSua_tbtt (
  id int PRIMARY KEY NOT null AUTO_INCREMENT,
  idPhieuSua int not null,
  idThietBiThayThe int not null,
  FOREIGN KEY (idPhieuSua) 
      REFERENCES PhieuSua (id) 
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
  FOREIGN KEY (idThietBiThayThe) 
    REFERENCES ThietBiThayThe (id) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);

INSERT INTO phongban (tenPhongBan) VALUES ('Hành chánh quản trị');
INSERT INTO phongban (tenPhongBan) VALUES ('Tài chính kế toán');
INSERT INTO phongban (tenPhongBan) VALUES ('Tổ chức cán bộ');
INSERT INTO phongban (tenPhongBan) VALUES ('Công nghệ thông tin');
INSERT INTO phongban (tenPhongBan) VALUES ('Kế hoạch tổng hợp');
INSERT INTO phongban (tenPhongBan) VALUES ('Điều dưỡng');
INSERT INTO phongban (tenPhongBan) VALUES ('Quản lý chất lượng - chỉ đạo tuyến');
INSERT INTO phongban (tenPhongBan) VALUES ('Vật tư thiết bị y tế');

