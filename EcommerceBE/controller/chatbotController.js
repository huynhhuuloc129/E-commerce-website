require('dotenv').config();
const axios = require('axios');

exports.ask = async (req, res) => {
    let myTable = `Dữ liệu của tôi bao gồm các bảng sau:
1. brand: brandId (int), name (varchar), created_at (timestampt), updated_at(timestampt), logo (varchar)
2. category: catid (int), name (varchar), created_at (timestampt), updated_at(timestampt), description (varchar)
2. component: componentId (int), name (varchar), created_at (timestampt), updated_at(timestampt), description (varchar)
3. product: proId (int), catId (int), brandId (int), name (varchar), created_at (timestampt), updated_at(timestampt), description (varchar), unit (varchar), guide(text), maintain (text), note (text)
4. product_component: productComponentId (int), productId (int), componentId (int),created_at (timestampt), updated_at(timestampt)
5. product_tag: productTagId (int), productId (int), tagId (int),created_at (timestampt), updated_at(timestampt)
6. tag: tagId (int), name(varchar), created_at (timestampt), updated_at(timestampt)
7. type: typeId (int), name(varchar), productId(int), unitPrice(int), quantityInStock(int) ,created_at (timestampt), updated_at(timestampt)
    
Hãy dựa trên các bảng trên trả lời câu hỏi sau đây bằng viết câu lệnh sql ngắn nhất có thể (không format), nếu các bảng không có ở trên thì trả lời rằng nguời dùng không có quyền truy cập vào các bảng đó, nếu hỏi ngoài lề thì trả lời bình thường: 
`

    const userQuery = myTable + req.body.query;

    var result

    try {
        const response = await axios.post(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=' + process.env.GEMINI_KEY,
            {
                contents: [
                    {
                        parts: [
                            {
                                text: userQuery
                            }
                        ]
                    }
                ]
            }
        );

        var query = response.data.candidates[0].content.parts[0].text.replaceAll("```", "").replaceAll("sql", "");
        connection.query(query, async (err, rows) => {

            if (err)
                res.status(200).json({
                    status: 'success1',
                    data: {
                        message: query,
                    },
                    err: err
                });
            else {
                result = new Array(rows)
                let userQuery1 = `Chỉ trả lời cho câu hỏi "${req.body.query}" bằng dữ liệu sau ${JSON.stringify(result)}. không diễn giải thêm.`
                console.log(result)
        
                let response1 = await axios.post(
                    'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyBK11F7QsKhgE-m5wi6WFbQjJzBud7SvNA',
                    {
                        contents: [
                            {
                                parts: [
                                    {
                                        text: userQuery1
                                    }
                                ]
                            }
                        ]
                    }
                );
        
                res.status(200).json({
                    status: 'success',
                    data: {
                        message: response1.data.candidates[0].content.parts[0].text,
                    },
                });
            }
        });

       
    } catch (error) {
        console.error('Error:', error);
    }
};
