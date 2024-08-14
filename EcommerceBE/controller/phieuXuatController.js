exports.getAllPX = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieuxuat ORDER BY ngayTao DESC', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    px: rows,
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
exports.getOnePX = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieuxuat WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    px: row,
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
        if (req.body && req.body.idTaiSan && req.body.idPhongBan && req.body.soLuong && req.body.ngayTao) {

            const newPX = {
                'idTaiSan': req.body.idTaiSan,
                'idPhongBan': req.body.idPhongBan,
                'soLuong': req.body.soLuong,
                'ngayTao': req.body.ngayTao.toString().slice(0, 10)
            }

            connection.query('INSERT INTO phieuxuat SET ?', newPX, (err, row) => {
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