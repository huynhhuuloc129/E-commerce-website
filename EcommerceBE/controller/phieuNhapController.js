exports.getAllPN = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieunhap ORDER BY ngayTao DESC', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    pn: rows,
                },
            });
        });
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};
exports.getOnePN = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieunhap WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    pn: row,
                },
            });
        });
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};

exports.create = async (req, res) => {
    try {
        if (req.body && req.body.idTaiSan && req.body.idDonViBanHang && req.body.donViMua && req.body.maSoThue && req.body.diaChi && req.body.soLuong && req.body.donGia && req.body.thanhTien && req.body.tienThue && req.body.tienThanhToan && req.body.hinhThucThanhToan && req.body.donViTienTe && req.body.ngayTao) {

            const newPN = {
                'idTaiSan': req.body.idTaiSan,
                'idDonViBanHang': req.body.idDonViBanHang,
                'donViMua': req.body.donViMua,
                'maSoThue': req.body.maSoThue,
                'diaChi': req.body.diaChi,
                'soLuong': req.body.soLuong,
                'donGia': req.body.donGia,
                'thanhTien': req.body.thanhTien,
                'tienThue': req.body.tienThue,
                'tienThanhToan': req.body.tienThanhToan,
                'hinhThucThanhToan': req.body.hinhThucThanhToan,
                'donViTienTe': req.body.donViTienTe,
                'ngayTao': req.body.ngayTao
            }

            connection.query('INSERT INTO phieunhap SET ?', newPN, (err, row) => {
                if (err) {
                    console.log(err)
                    res.status(400).json({
                        errorMessage: err,
                        status: false
                    });
                } else
                    res.status(200).json({
                        status: true,
                        title: 'Created Successfully.'
                    });
            })
        } else {
            res.status(400).json({
                errorMessage: 'Add proper parameter first!',
                status: false
            });
        }
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};