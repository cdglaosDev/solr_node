//mysql connection setup
import mysql from "mysql";
var connection = mysql.createPool({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: "",
  database: "vrms_db",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

export default connection;
