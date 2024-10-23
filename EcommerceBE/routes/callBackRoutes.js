const express = require('express');
const paymentController = require('./../controller/paymentController');
const axios = require('axios')
const router = express.Router();

router
    .route('/')
    .post((req, res) => {
        let result = {};
        console.log(req.body);
        try {
          let dataStr = req.body.data;
          let reqMac = req.body.mac;
      
          let mac = CryptoJS.HmacSHA256(dataStr, config.key2).toString();
          console.log('mac =', mac);
      
          // kiểm tra callback hợp lệ (đến từ ZaloPay server)
          if (reqMac !== mac) {
            // callback không hợp lệ
            result.return_code = -1;
            result.return_message = 'mac not equal';
          } else {
            // thanh toán thành công
            // merchant cập nhật trạng thái cho đơn hàng ở đây
            let dataJson = JSON.parse(dataStr, config.key2);
            console.log(
              "update order's status = success where app_trans_id =",
              dataJson['app_trans_id'],
            );
      
            result.return_code = 1;
            result.return_message = 'success';
          }

        } catch (ex) {
            
          console.log('lỗi:::' + ex.message);
          result.return_code = 0; // ZaloPay server sẽ callback lại (tối đa 3 lần)
          result.return_message = ex.message;
        }
      
        res.json(result);
      });


module.exports = router;
