exports.getAllPsTbtt = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieusua_tbtt', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    ps_tbtt: rows,
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

exports.getAllByPsId = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieusua_tbtt WHERE idPhieuSua = ?', req.params.id, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    ps_tbtt: rows,
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
exports.getOnePsTbtt = async (req, res) => {
    try {
        connection.query('SELECT * FROM phieusua_tbtt WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    ps_tbtt: row,
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

        if (req.body && req.body.idPhieuSua && req.body.idThietBiThayThe) {

            const newPS = {
                'idPhieuSua': req.body.idPhieuSua,
                'idThietBiThayThe': req.body.idThietBiThayThe,
            }

            connection.query('INSERT INTO phieusua_tbtt SET ?', newPS, (err, row) => {
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
        var ids = req.body.ids

        connection.query("DELETE FROM phieusua_tbtt WHERE id = ?", req.params.id, (err, row) => {
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

exports.truncate = async (req, res) => {
    try {
        connection.query("DELETE * FROM phieusua_tbtt where idPhieuSua = ?`", idPhieuSua, (err, row) => {
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