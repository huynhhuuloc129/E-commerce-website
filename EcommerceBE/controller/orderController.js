exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM Orders', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    order: rows,
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
exports.getDetailsByAccountId = async (req, res) => {
    try {
        let sql = `SELECT 
                    o.*, 
                    sp.selectedProductId, 
                    sp.typeId, 
                    sp.quantitySelected,
                    sp.sellingPrice,
                    t.name as typeName, 
                    t.productId, 
                    p.name AS productName,
                    i.base64 AS imageBase64
                    FROM orders o
                JOIN selectedProduct sp ON o.orderId = sp.orderId
                JOIN type t ON sp.typeId = t.typeId
                JOIN product p ON t.productId = p.proId
                LEFT JOIN (
                    SELECT imageId, base64, belongId
                    FROM image
                    WHERE imageId IN (
                        SELECT MIN(imageId) -- You can use other criteria like MAX(imageId) or a different condition
                        FROM image
                        GROUP BY belongId
                    )
                ) i ON i.belongId = CONCAT('product', p.proId)
                WHERE o.accountId = ${req.params.id}
                ORDER BY o.orderId;

`
        connection.query(sql, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    order: rows,
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
exports.getAllByAccountIdAndShipped = async (req, res) => {
    try {
        connection.query('SELECT * FROM Orders WHERE shipped = 1 AND accountId = ?', req.params.id, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    order: rows,
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
        connection.query('SELECT * FROM Orders WHERE orderId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    order: row,
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
        if (req.body && req.body.accountId && req.body.totalPrice && req.body.shippingPrice && req.body.shippingAddress) {

            const newOrder = {
                'accountId': req.body.accountId,
                'totalPrice': req.body.totalPrice,
                'shippingPrice': req.body.shippingPrice,
                'shippingAddress': req.body.shippingAddress,
                'shipped': req.body.shipped,
                'shippedDate': req.body.shippedDate,
                'shipmentTracking': req.body.shipmentTracking,
                'paid': req.body.paid                
            }

            connection.query('INSERT INTO orders SET ?', newOrder, (err, row) => {
                if (err) {
                    console.log(err)
                    res.status(400).json({
                        errorMessage: err,
                        status: false
                    });
                } else
                
                    var sql = `UPDATE selectedproduct SET block = 1 , orderId = ${row.insertId} WHERE block = 0 AND accountId = ${req.body.accountId}`
                    connection.query(sql, (err, row) => {
                        if (err) {
                            console.log(err)
                            res.status(400).json({
                                errorMessage: err,
                                status: false
                            });
                        } 
                    })

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
        connection.query("DELETE FROM orders WHERE orderId = ?", req.params.id, (err, row) => {
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