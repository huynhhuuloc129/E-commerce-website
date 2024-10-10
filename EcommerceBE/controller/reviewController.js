exports.getAll = async (req, res) => {
    try {
        connection.query(`SELECT r.*, a.name, a.email, a.avatar, p.name productName
FROM review r
JOIN account a ON r.accountId = a.accountId
JOIN product p ON r.productId = p.proId`, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    review: rows,
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

exports.getAllByProductId = async (req, res) => {
    try {
        connection.query(`SELECT r.reviewId, r.productId, r.accountId, r.content, r.star, r.created_at, r.updated_at, a.name, a.email, a.avatar
FROM review r
JOIN account a ON r.accountId = a.accountId
WHERE r.productId = ?`, req.params.id, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    review: rows,
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


exports.getAllByProductIdAndAccountId = async (req, res) => {
    try {
        query = `SELECT r.reviewId, r.productId, r.accountId, r.content, r.star, r.created_at, r.updated_at, a.name, a.email, a.avatar
FROM review r
JOIN account a ON r.accountId = a.accountId
WHERE r.productId = ${req.params.productId} AND a.accountId = ${req.params.accountId}`


        connection.query(query, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    review: rows,
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
        connection.query('SELECT * FROM Review WHERE reviewId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    review: row,
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
        if (req.body && req.body.productId  && req.body.accountId && req.body.content && req.body.star) {

            const newReview = {
                'productId': req.body.productId,
                'accountId': req.body.accountId,
                'content': req.body.content,
                'star': req.body.star             
            }

            connection.query('INSERT INTO review SET ?', newReview, (err, row) => {
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
        connection.query("DELETE FROM review WHERE reviewId = ?", req.params.id, (err, row) => {
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
        if (req.body  && req.body.content && req.body.star) {

            const newReview = {
                reviewId: req.params.id,
                content: req.body.content,
                star: req.body.star,
            }

            let sql = `UPDATE review SET
                content = '${newReview.content}',
                star = ${newReview.star}
            WHERE reviewId = ${newReview.reviewId}`

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