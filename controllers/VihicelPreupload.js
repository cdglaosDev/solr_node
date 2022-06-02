import dataJson from "../../files/update_data02_31.json" assert { type: "json" };
import db from "../util/database.js";

async function savetoVehiclepreupload() {
  delete (await db.vehicleVDVCPreUpload
    .truncate()
    .then(() => {
      console.log("Delete data in table is sccuess");
    })
    .catch((err) => {
      console.log(err);
    }));

  //insert
  let dates = [];
  let char = [];
  let num = 0;
  const cashData = dataJson.response.docs;
  for (let index = 0; index < cashData.length; index++) {
    let str = await cashData[index].note_id_t;
    const note = cashData[index].note_id_t.match(/\d{4}([\/.-])\d{2}\1\d{2}/g);
    // const note = cashData[index].note_id_t.match(/\d{4}(\D)\d{2}\1\d{2}/g);

    if (note) {
      dates.push(cashData[index].note_id_t);
    } else {
      char.push(cashData[index].note_id_t);
      await db.vehicleVDVCPreUpload.create(cashData[index]);
      console.log("Sucess " + ++num);
    }
  }
  console.log("Data NOT insert = " + dates.length);
  console.log("Data is insert = " + char.length);
}

export default { savetoVehiclepreupload };
