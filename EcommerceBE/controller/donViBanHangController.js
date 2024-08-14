exports.getAllDVBH = async (req, res) => {
    try {
        connection.query('SELECT * FROM donvibanhang', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    dvbh: rows,
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
exports.getOneDVBH = async (req, res) => {
    try {
        connection.query('SELECT * FROM donvibanhang WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    dvbh: row,
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
        if (req.body && req.body.ten && req.body.maSoThue && req.body.diaChi && req.body.sdt && req.body.email && req.body.taiKhoan) {

            const newDVBH = {
                'ten': req.body.ten,
                'maSoThue': req.body.maSoThue,
                'diaChi': req.body.diaChi,
                'sdt': req.body.sdt,
                'email': req.body.email,
                'taiKhoan': req.body.taiKhoan,
            }

            connection.query('INSERT INTO donvibanhang SET ?', newDVBH, (err, row) => {
                if (err) {
                    console.log(err)
                    res.status(400).json({
                        errorMessage: err,
                        status: false
                    });
                } else
                    res.status(200).json({
                        status: true,
                        title: 'Created Successfully.',
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

exports.delete = async (req, res) => {
    try {
        connection.query("DELETE FROM donvibanhang WHERE id = ?", req.params.id, (err, row) => {
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