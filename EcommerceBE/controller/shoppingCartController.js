exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM shopping_cart ORDER BY createdAt DESC', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    ps: rows,
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
exports.getOne = async (req, res) => {
    try {
        connection.query('SELECT * FROM shopping_cart WHERE shoppingCartId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    ps: row,
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
        if (req.body && req.body.ngayTao && req.body.idTaiSan && req.body.idPhongBan && req.body.tinhTrang) {

            const newPS = {
                'ngayTao': req.body.ngayTao,
                'idTaiSan': req.body.idTaiSan,
                'idPhongBan': req.body.idPhongBan,
                'tinhTrang': req.body.tinhTrang,
            }

            connection.query('INSERT INTO phieusua SET ?', newPS, (err, row) => {
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

exports.delete = async (req, res) => {
    try {
        connection.query("DELETE FROM phieusua WHERE id = ?", req.params.id, (err, row) => {
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


exports.update = async (req, res) => {
    try {
        if (req.body && req.body.id && req.body.ngayTao && req.body.idTaiSan && req.body.idPhongBan && req.body.tinhTrang) {

            const newPS = {
                'ngayTao': req.body.ngayTao.toString().slice(0, 10),
                'idTaiSan': req.body.idTaiSan,
                'idPhongBan': req.body.idPhongBan,
                'tinhTrang': req.body.tinhTrang,
                'daSua': req.body.daSua,
            }

            let sql = `UPDATE phieusua SET 
                ngayTao = '${newPS.ngayTao}', 
                idTaiSan = '${newPS.idTaiSan}', 
                idPhongBan = '${newPS.idPhongBan}', 
                tinhTrang = '${newPS.tinhTrang}', 
                daSua = '${newPS.daSua}'
            WHERE id = '${req.body.id}'`

            connection.query(sql, (err, row) => {
                if (err) {
                    console.log(err)
                    res.status(400).json({
                        errorMessage: err,
                        status: false
                    });
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
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};
