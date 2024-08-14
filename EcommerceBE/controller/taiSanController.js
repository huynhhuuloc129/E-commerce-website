exports.getAllTS = async (req, res) => {
    try {
        connection.query('SELECT * FROM taisan', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    ts: rows,
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

exports.getOneTS = async (req, res) => {
    try {
        connection.query('SELECT * FROM taisan WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    ts: row,
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
        if (req.body && req.body.ten && req.body.ngayNhap && req.body.hsd && req.body.soluong && req.body.soLo && req.body.donGia && req.body.donViTinh && req.body.idLoaiTaiSan && req.body.idPhongBan) {

            const newTS = {
                'ten': req.body.ten,
                'ngayNhap': req.body.ngayNhap,
                'hsd': req.body.hsd,
                'soluong': req.body.soluong,
                'soLo': req.body.soLo,
                'donGia': req.body.donGia,
                'donViTinh': req.body.donViTinh,
                'idLoaiTaiSan': req.body.idLoaiTaiSan,
                'idPhongBan': req.body.idPhongBan
            }

            connection.query('INSERT INTO taisan SET ?', newTS, (err, row) => {
                if (err) {
                    throw err;
                } else
                
                res.status(200).json({
                    status: true,
                    title: 'Created Successfully.'
                });
            })
        }
            else {
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

exports.update = async (req, res) => {
    try {
        if (req.body && req.body.id && req.body.ten && req.body.ngayNhap && req.body.hsd && req.body.soluong && req.body.soLo && req.body.donGia && req.body.donViTinh && req.body.idLoaiTaiSan && req.body.idPhongBan) {

            const newTS = {
                'id': req.body.id,
                'ten': req.body.ten,
                'ngayNhap': req.body.ngayNhap.toString().slice(0, 10),
                'hsd': req.body.hsd.toString().slice(0, 10),
                'soluong': req.body.soluong,
                'soLo': req.body.soLo,
                'donGia': req.body.donGia,
                'donViTinh': req.body.donViTinh,
                'idLoaiTaiSan': req.body.idLoaiTaiSan,
                'idPhongBan': req.body.idPhongBan
            }

            let sql = `UPDATE taisan SET 
                ten = '${newTS.ten}', 
                ngayNhap = '${newTS.ngayNhap}', 
                hsd = '${newTS.hsd}', 
                soluong = ${newTS.soluong}, 
                soLo = '${newTS.soLo}', 
                donGia = ${newTS.donGia}, 
                donViTinh = '${newTS.donViTinh}', 
                idLoaiTaiSan = ${newTS.idLoaiTaiSan},
                idPhongBan = ${newTS.idPhongBan}
            WHERE id = ${newTS.id}`

            connection.query(sql, (err, row) => {
                if (err) {
                    console.log(err)
                    return;
                } else
                    res.status(200).json({
                        status: true,
                        title: 'Update Successfully.'
                    });
            }
            )
        } else {
            res.status(400).json({
                errorMessage: 'Add proper parameter first!',
                status: false
            });
        }
    } catch (err) {
        console.log(err)
        res.status(500).json({
            status: 'fail',
            message: err,
        });
    }
};
exports.delete = async (req, res) => {
    try {
        connection.query("DELETE FROM taisan WHERE id = ", req.params.id, (err, row) => {
            if (err) {
                console.log(err)
                res.status(400).json({
                    errorMessage: err,
                    status: false
                });
            } else
                res.status(200).json({
                    status: true,
                    title: 'Delete Successfully.'
                });
        }
        )
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};