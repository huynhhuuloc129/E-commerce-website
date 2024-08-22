exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM product_tag', (err,rows) => {
            if(err) throw err;
            
            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    product_tag: rows,
                },
            });
        });
    }  catch (err) {
    res.status(404).json({
        status: 'fail',
        message: err,
    });
    }
};
exports.getOne = async (req, res) => {
    try {
        connection.query('SELECT * FROM product_tag WHERE id = ?', req.params.id, (err,row) => {
            if(err) throw err;
            
            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    product_tag: row,
                },
            });
        });
    }  catch (err) {
    res.status(404).json({
        status: 'fail',
        message: err,
    });
    }
};