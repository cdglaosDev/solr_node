import dataJson from "../../files/update_data2020_4-6.json" assert { type: "json" };
import connection from "../util/config.js";

function TruncateTable() {
  // delete
  return new Promise((resolve, reject) => {
    connection.query("TRUNCATE table vehicles_pre_upload", (err, result) => {
      if (err) console.log(err);
      resolve("TrunCate table is Sucess!!!");
    });
  });
}

function Allvehicles_preupload() {
  // addd
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM `vehicles_pre_upload`", (err, result) => {
      if (err) console.log(err);
      resolve(result);
      reject(err);
    });
  });
}

async function savetoVehiclepreupload() {
  //   insert;
  let num = 0;
  const cashData = await dataJson.response.docs;
  for (let index = 0; index < cashData.length; index++) {
    connection.query(
      "INSERT INTO vehicles_pre_upload SET ?",
      cashData[index],
      (err, results) => {
        if (err) {
          console.error(err);
          console.log("note_id: " + cashData[index].note_id_t);
          process.exit(0);
        }
        console.log("Sucess " + ++num);
      }
    );
  }
  //   reading
  connection.query(
    "SELECT count(*) as counts FROM `vehicles_pre_upload`",
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        console.log("Data Insert is : " + result[0].counts);
      }
    }
  );
}
export default { savetoVehiclepreupload, TruncateTable, Allvehicles_preupload };
