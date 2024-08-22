const bcrypt = require('bcrypt');
var jwt = require('jsonwebtoken');

exports.getAll = async (req, res) => {
    try {
        connection.query('SELECT * FROM tag', (err, rows) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: rows.length,
                data: {
                    nd: rows,
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
        connection.query('SELECT * FROM tag WHERE id = ?', req.params.id, (err, row) => {
            if (err) throw err;

            console.log('Data received from Db:');
            res.status(200).json({
                status: 'success',
                total: row.length,
                data: {
                    nd: row,
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
        connection.query('SELECT * FROM nguoidung WHERE taiKhoan = ?', username, async (err, row) => {
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
            user.matKhau = row[0].matKhau;
            user.taiKhoan = row[0].taiKhoan;
            user.id = row[0].id;

            await bcrypt.compare(req.body.password, user.matKhau, (err, data) => {
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

exports.register = async (req, res) => {
    try {
        if (req.body && req.body.username && req.body.password && req.body.password && req.body.password) {
            username = req.body.username
            connection.query('SELECT * FROM nguoidung WHERE taikhoan = ?', req.body.username, (err, row) => {
                if (err) throw err;

                console.log('Data received from Db:');


                if (row == undefined || row.length == 0) {
                    const salt = bcrypt.genSaltSync(10)

                    const newUser = {
                        'taikhoan': req.body.username,
                        'matkhau': bcrypt.hashSync(req.body.password, salt),
                        'hoTen': req.body.fullName,
                        'email': req.body.email,
                        'vaitro': req.body.role,
                        'idphongban': req.body.idRoom
                    }

                    connection.query('INSERT INTO nguoidung SET ?', newUser, (err, row) => {
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

exports.getMe = async (req, res) => {
    try {
        if (req.header('token')) {
            let token = req.header('token');

            var decoded = jwt.verify(token, 'shhhhh11111');
            connection.query('SELECT * FROM nguoidung WHERE id = ?', decoded.id, (err, row) => {
                if (err) {
                    res.status(500).json({
                        status: 'fail',
                        message: err,
                    });
                };

                if (row.length >= 0) {
                    res.status(200).json({
                        status: 'success',
                        data: {
                            nd: row,
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

exports.update = async (req, res) => {
    try {
        if (req.body) {
            let count = 0
            let sql = ''
            if (req.body.maNhanVien != null && req.body.maNhanVien.length > 0) {
                count++;
                sql += `maNhanVien = '${req.body.maNhanVien}' `
            }
            if (req.body.hoTen != null && req.body.hoTen.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `hoTen = '${req.body.hoTen}' `
            }
            if (req.body.email != null && req.body.email.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `email = '${req.body.email}' `
            }
            if (req.body.sdt != null && req.body.sdt.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `sdt = '${req.body.sdt}' `
            }
            if (req.body.ngaySinh != null && req.body.ngaySinh.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `ngaySinh = '${req.body.ngaySinh}' `
            }
            if (req.body.avatar != null && req.body.avatar.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `avatar = '${req.body.avatar}' `
            }
            if (req.body.vaiTro != null && req.body.vaiTro.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `vaiTro = '${req.body.vaiTro}' `
            }
            if (req.body.idPhongBan != null && req.body.idPhongBan.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `idPhongBan = '${req.body.idPhongBan}' `
            }
            if (req.body.chucVu != null && req.body.chucVu.length > 0) {
                if (count > 0) sql += ', '
                count++;
                sql += `chucVu = '${req.body.chucVu}' `
            }

            sql = 'UPDATE nguoidung SET ' + sql + `WHERE id = ${req.body.id};`

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

exports.changePassword = async (req, res) => {
    try {
        
        if (req.body && req.body.matKhau && req.body.id && req.body.matKhauMoi) {
            user = {}

            connection.query('SELECT * FROM nguoidung WHERE id = ?', req.body.id, async (err, row) => {
                if (err) {
                    res.status(500).json({
                        status: 'fail',
                        message: err,
                    });
                };

                
                if (row.length >= 0) {
                    user.matKhau = row[0].matKhau;
                    await bcrypt.compare(req.body.matKhau, user.matKhau, (err, data) => {
                        if (err) throw err

                        if (data) {
                            const salt = bcrypt.genSaltSync(10)

                            const newPassword = bcrypt.hashSync(req.body.matKhauMoi, salt)

                            sql = `UPDATE nguoidung SET matKhau = '${newPassword}' WHERE id = ${req.body.id};`

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
    jwt.sign({ user: data.taiKhoan, id: data.id }, 'shhhhh11111', { expiresIn: '1d' }, (err, token) => {
        if (err) {
            res.status(400).json({
                status: false,
                errorMessage: err,
            });
        } else {
            res.status(200).json({
                message: 'Login Successfully.',
                id: data.id,
                token: token,
                status: true
            });
        }
    });
}