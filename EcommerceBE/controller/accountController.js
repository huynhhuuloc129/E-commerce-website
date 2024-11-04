const bcrypt = require('bcrypt');
var jwt = require('jsonwebtoken');

exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM account', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    accounts: rows,
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


exports.update = async (req, res) => {
    try {
        if (req.body  && req.body.name && req.body.email && req.body.phone && req.body.birthDate && req.body.billingAddress) {

            const account = {
                accountId: req.params.id,
                name: req.body.name,
                email: req.body.email,
                phone: req.body.phone,
                birthDate: req.body.birthDate,
                billingAddress: req.body.billingAddress
            }

            let sql = `UPDATE account SET
                name = '${account.name}',
                email = '${account.email}',
                phone = '${account.phone}',
                birthDate = '${account.birthDate}',
                billingAddress = '${account.billingAddress}'
            WHERE accountId = ${account.accountId}`

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


exports.updateAvatar = async (req, res) => {
    try {
        if (req.body && req.body.avatar) {

            const account = {
                accountId: req.params.id,
                avatar: req.body.avatar,
            }

            let sql = `UPDATE account SET
                avatar = '${account.avatar}'
            WHERE accountId = ${account.accountId}`

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

// exports.getAllByPsId = async (req, res) => {
//     try {
//         connection.query('SELECT * FROM account WHERE accountId = ?', req.params.id, (err, rows) => {
//             if (err) throw err;

//             console.log('Data received from Db:');
//             res.status(200).json({
//                 status: 'success',
//                 total: rows.length,
//                 data: {
//                     accounts: rows,
//                 },
//             });
//         });
//     } catch (err) {
//         res.status(404).json({
//             status: 'fail',
//             message: err,
//         });
//     }
// };
exports.getOne = async (req, res) => {
    try {
        connection.query('SELECT * FROM account WHERE accountId = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    accounts: row,
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

exports.register = async (req, res) => {
    try {

        if (req.body && req.body.username && req.body.password && req.body.name && req.body.email && req.body.phone && req.body.birthDate && req.body.billingAddress) {
            username = req.body.username
            connection.query('SELECT * FROM account WHERE username = ?', req.body.username, (err, row) => {
                if (err) throw err;

                console.log('Data received from Db:');


                if (row == undefined || row.length == 0) {
                    const salt = bcrypt.genSaltSync(10)

                    const newAccount = {
                        'username': req.body.username,
                        'password': bcrypt.hashSync(req.body.password, salt),
                        'name': req.body.name,
                        'email': req.body.email,
                        'phone': req.body.phone,
                        'birthDate': req.body.birthDate,
                        'billingAddress': req.body.billingAddress
                    }

                    connection.query('INSERT INTO account SET ?', newAccount, (err, row) => {
                        if (err) {
                            console.log(err)
                            res.status(400).json({
                                errorMessage: err,
                                status: false
                            });
                        } else
                            res.status(200).json({
                                status: true,
                                title: 'Registered Successfully.'
                            });
                    })

                } else {
                    // console.log(`UserName ${req.body.username} Already Exist!`);
                    res.status(400).json({
                        errorMessage: `UserName ${req.body.username} Already Exist!`,
                        status: false
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


exports.loginGoogle = async (req, res) => {
    try {
        if (req.body && req.body.username && req.body.password && req.body.email && req.body.avatar){
            const salt = bcrypt.genSaltSync(10)

            const newAccount = {
                'username': req.body.username,
                'password': bcrypt.hashSync(req.body.password, salt),
                'name': req.body.name,
                'email': req.body.email,
                'avatar': req.body.avatar
            }

        connection.query('SELECT * FROM account WHERE username = ?', req.body.username, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');


            if (row == undefined || row.length == 0) {

                connection.query('INSERT INTO account SET ?', newAccount, (err, row) => {
                    if (err) {
                        console.log(err)
                        res.status(400).json({
                            errorMessage: err,
                            status: false
                        });
                    } else
                    checkUserAndGenerateToken({username: req.body.username, accountId: row.insertId}, req, res)

                })

            } else {
                checkUserAndGenerateToken({username: req.body.username, accountId: row[0].accountId}, req, res)
            }
        });
    }else {
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

exports.getMe = async (req, res) => {
    try {
        if (req.header('Token')) {
            let token = req.header('Token');

            var decoded = jwt.verify(token, 'shhhhh11111');

            connection.query('SELECT * FROM account WHERE username = ?', decoded.user, (err, row) => {
                if (err) {
                    res.status(500).json({
                        status: 'fail',
                        message: err,
                    });
                } else
                if (row.length >= 0) {
                    res.status(200).json({
                        status: 'success',
                        data: {
                            account: row,
                        },
                    });
                } else {
                    res.status(404).json({
                        errorMessage: `User not found!`,
                        status: false
                    });
                }
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
        connection.query("DELETE FROM account WHERE accountId = ?", req.params.id, (err, row) => {
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


exports.login = async (req, res) => {
    try {
        if (!req.body || !req.body.username || !req.body.password) {
            res.status(400).json({
                errorMessage: 'Add proper parameter first!',
                status: false
            });
        }
        username = req.body.username
        user = {}
        connection.query('SELECT * FROM account WHERE username = ?', username, async (err, row) => {
            if (err) {
                res.status(500).json({
                    status: 'fail',
                    message: err,
                });
            };

            console.log('Data received from Db');
            if (row == null || row.length == 0) {
                res.status(400).json({
                    errorMessage: 'No accounts found!',
                    status: false
                });
            }
            user.password = row[0].password;
            user.username = row[0].username;
            user.id = row[0].accountId;

            await bcrypt.compare(req.body.password, user.password, (err, data) => {
                if (err) throw err
                if (data) {
                    checkUserAndGenerateToken(user, req, res);
                } else {
                    res.status(401).json({ msg: "Invalid credencial!" })
                }
            })
        });
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            message: err,
        });
    }
};

exports.changePassword = async (req, res) => {
    try {
        
        if (req.body && req.body.username && req.body.accountId && req.body.newPassword) {
            user = {}

            connection.query('SELECT * FROM account WHERE accountId = ?', req.body.accountId, async (err, row) => {
                if (err) {
                    res.status(500).json({
                        status: 'fail',
                        message: err,
                    });
                };

                
                if (row.length >= 0) {
                    user.password = row[0].password;
                    await bcrypt.compare(req.body.password, user.password, (err, data) => {
                        if (err) throw err

                        if (data) {
                            const salt = bcrypt.genSaltSync(10)

                            const newPassword = bcrypt.hashSync(req.body.newPassword, salt)

                            sql = `UPDATE account SET password = '${newPassword}' WHERE accountId = ${req.body.accountId};`

                            connection.query(sql, (err, row) => {
                                if (err) {
                                    res.status(500).json({
                                        status: 'fail',
                                        message: err,
                                    });
                                };

                                res.status(200).json({
                                    status: 'update success',
                                    data: {
                                        nd: row,
                                    },
                                });
                            })
                        } else {
                            res.status(401).json({ msg: "Invalid credencial!" })
                        }
                    })
                } else {
                    res.status(404).json({
                        errorMessage: `User not found!`,
                        status: false
                    });
                }
            })
        } else {
            res.status(400).json({
                errorMessage: 'Add proper parameter first!',
                status: false
            });
        }
    } catch (err) {
        res.status(500).json({
            status: 'fail',
            message: err,
        });
    }
};

function checkUserAndGenerateToken(data, req, res) {
    jwt.sign({ user: data.username, accountId: data.accountId }, 'shhhhh11111', { expiresIn: '1d' }, (err, token) => {
        if (err) {
            res.status(400).json({
                status: false,
                errorMessage: err,
            });
        } else {
            res.status(200).json({
                message: 'Login Successfully.',
                accountId: data.accountId,
                token: token,
                status: true
            });
        }
    });
}

// exports.truncate = async (req, res) => {
//     try {
//         connection.query("DELETE * FROM account where idPhieuSua = ?`", idPhieuSua, (err, row) => {
//             if (err) {
//                 console.log(err)
//                 res.status(400).json({
//                     errorMessage: err,
//                     status: false
//                 });
//             } else
//                 res.status(200).json({
//                     status: true,
//                     title: 'Delete Successfully.'
//                 });
//         }
//         )
//     } catch (err) {
//         res.status(404).json({
//             status: 'fail',
//             message: err,
//         });
//     }
// };