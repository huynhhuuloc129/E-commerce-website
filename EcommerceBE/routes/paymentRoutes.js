const express = require('express');
const paymentController = require('./../controller/paymentController');
const axios = require('axios')
const router = express.Router();
const moment = require('moment')
const CryptoJS = require('crypto-js');
const config = {
  app_id: '2553',
  key1: 'PcY4iZIKFCIdgZvA6ueMcMHHUbRLYjPL',
  key2: 'kLtgPl8HHhfvMuDHPwKfgfsY4Ydm9eIz',
  endpoint: 'https://sb-openapi.zalopay.vn/v2/create',
};

router
  .route('/')
  .post( async (req, res) => {
    const embed_data = {
      //sau khi hoàn tất thanh toán sẽ đi vào link này (thường là link web thanh toán thành công của mình)
      redirecturl: 'http://localhost:5173',
    };
  
    const items = [];
    const transID = Math.floor(Math.random() * 1000000);
  
    const order = {
      app_id: config.app_id,
      app_trans_id: `${moment().format('YYMMDD')}_${transID}`, // translation missing: vi.docs.shared.sample_code.comments.app_trans_id
      app_user: 'user123',
      app_time: Date.now(), // miliseconds
      item: JSON.stringify(items),
      embed_data: JSON.stringify(embed_data),
      amount: req.body.amount,
      //khi thanh toán xong, zalopay server sẽ POST đến url này để thông báo cho server của mình
      //Chú ý: cần dùng ngrok để public url thì Zalopay Server mới call đến được
      callback_url: 'http://localhost:3000/callback',
      description: req.body.description,
      bank_code: '',
    };
  
    // appid|app_trans_id|appuser|amount|apptime|embeddata|item
    const data =
      config.app_id +
      '|' +
      order.app_trans_id +
      '|' +
      order.app_user +
      '|' +
      order.amount +
      '|' +
      order.app_time +
      '|' +
      order.embed_data +
      '|' +
      order.item;
    order.mac = CryptoJS.HmacSHA256(data, config.key1).toString();
  
    try {
      const result = await axios.post(config.endpoint, null, { params: order });
  
      return res.status(200).json(result.data);
    } catch (error) {
      console.log(error);
    }
  });


module.exports = router;
