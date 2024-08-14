exports.getAllCHTS = async (req, res) => {
    try {
        connection.query('SELECT * FROM cauhinhthongso', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    chts: rows,
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
exports.getOneCHTS = async (req, res) => {
    try {
        connection.query('SELECT * FROM cauhinhthongso WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    chts: row,
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
        if (req.body && req.body.cpu && req.body.ram && req.body.hdd && req.body.ssd && req.body.cardDoHoa && req.body.manHinh && req.body.idTaiSan) {

            const newCHTS = {
                'cpu': req.body.cpu,
                'ram': req.body.ram,
                'hdd': req.body.hdd,
                'ssd': req.body.ssd,
                'cardDoHoa': req.body.cardDoHoa,
                'manHinh': req.body.manHinh,
                'idTaiSan': req.body.idTaiSan
            }

            connection.query('INSERT INTO cauhinhthongso SET ?', newCHTS, (err, row) => {
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