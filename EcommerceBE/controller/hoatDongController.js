exports.getAllHD = async (req, res) => {
    try {
        connection.query('SELECT * FROM hoatdong', (err,rows) => {
            if(err) throw err;
            
            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    hd: rows,
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
exports.getOneHD = async (req, res) => {
    try {
        connection.query('SELECT * FROM hoatdong WHERE id = ?', req.params.id, (err,row) => {
            if(err) throw err;
            
            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    hd: row,
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