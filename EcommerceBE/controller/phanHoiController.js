exports.getAllPH = async (req, res) => {
    try {
        connection.query('SELECT * FROM phanhoi', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    ph: rows,
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
exports.getOnePH = async (req, res) => {
    try {
        connection.query('SELECT * FROM phanhoi WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    ph: row,
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