//mysql connection setup
import mysql from "mysql2";
var connection = mysql.createPool({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "",
  database: "vrms_db",
  waitForConnections: true,
  connectionLimit: 100,
  queueLimit: 0,
});

export default connection;
