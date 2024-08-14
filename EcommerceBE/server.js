const dotenv = require('dotenv');
const mysql = require('mysql2');

dotenv.config({ path: './config.env' });

const app = require('./app.js');
const port = process.env.PORT || 3000;

global.connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'bv'
});


connection.connect((error)=>{
  if(error){
  console.error('Error connecting to MySQL database:', error);
  }else{
  console.log('Connected to MySQL database!');
  }
});

app.listen(port, () => {
  console.log(`Listening on port ${port}...`);
});
