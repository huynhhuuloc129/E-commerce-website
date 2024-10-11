exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM product', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    products: rows,
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

exports.getAllByBrandId = async (req, res) => {
    try {
        connection.query('SELECT * FROM product WHERE brandId = ?', req.params.id, (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    products: rows,
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
        connection.query('SELECT * FROM product WHERE proId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    products: row,
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
        if (req.body && req.body.catId && req.body.brandId && req.body.name && req.body.description && req.body.unit && req.body.guide && req.body.maintain && req.body.note && req.body.types && req.body.tagIds && req.body.images) {

            const newProduct = {
                catId: req.body.catId,
                brandId: req.body.brandId,
                name: req.body.name,
                description: req.body.description,
                unit: req.body.unit,
                guide: req.body.guide,
                maintain: req.body.maintain,
                note: req.body.note
            }

            connection.query('INSERT INTO product SET ?', newProduct, (err, row) => {
                if (err) {
                    console.log(err);
                    return res.status(400).json({
                        errorMessage: err,
                        status: false
                    });
                } else {
                    // Loop through the images array
                    for (let i = 0; i < req.body.images.length; i++) {
                        let newImage = {
                            base64: req.body.images[i], 
                            belongId: "product" + row.insertId // Using row.insertId from product insert
                        };
            
                        // Insert each image into the image table
                        connection.query('INSERT INTO image SET ?', newImage, (err, result) => { // Use newImage instead of newProduct
                            if (err) {
                                console.log(err);
                                return res.status(400).json({
                                    errorMessage: err,
                                    status: false
                                });
                            }
                        });
                    }
            
                    for (let i = 0; i < req.body.types.length; i++) {
                        let newType = {
                            name: req.body.types[i].name, 
                            productId: row.insertId, 
                            unitPrice: req.body.types[i].unitPrice, // Using row.insertId from product insert
                            quantityInStock: req.body.types[i].quantityInStock
                        };
            
                        connection.query('INSERT INTO type SET ?', newType, (err, result) => {
                            if (err) {
                                console.log(err);
                                return res.status(400).json({
                                    errorMessage: err,
                                    status: false
                                });
                            }
                        });
                    }

                    for (let i = 0; i < req.body.tagIds.length; i++) {
                        let newProductTag = {
                            productId: row.insertId, 
                            tagId: req.body.tagIds[i]
                        };
            
                        connection.query('INSERT INTO product_tag SET ?', newProductTag, (err, result) => {
                            if (err) {
                                console.log(err);
                                return res.status(400).json({
                                    errorMessage: err,
                                    status: false
                                });
                            }
                        });
                    }

                    // Send success response after inserting product
                    res.status(200).json({
                        message: "Product and images inserted successfully",
                        status: true
                    });
                }
            });
            
     
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
        connection.query("DELETE FROM product WHERE id = ?", req.params.id, (err, row) => {
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