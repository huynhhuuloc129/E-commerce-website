exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM selected_product', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    sProducts: rows,
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
        connection.query('SELECT * FROM selected_product WHERE selectedProductId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    sProducts: row,
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
        if (req.body && req.body.proId  && req.body.shoppingCartId && req.body.orderId) {

            const newSelectedProduct = {
                'proId': req.body.proId,
                'shoppingCartId': req.body.shoppingCartId,
                'orderId': req.body.orderId
            }

            connection.query('INSERT INTO selected_product SET ?', newSelectedProduct, (err, row) => {
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
        connection.query("DELETE FROM selected_product WHERE selectedProductId = ?", req.params.id, (err, row) => {
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