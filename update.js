import xlsx from "xlsx";
import db from "./util/database.js";
import vehicleController from "./controllers/Vehicles.js";
import logController from "./controllers/Logs.js";
import historyController from "./controllers/Histories.js";
import fileController from "./controllers/File.js";
import saveJson from "./controllers/VihicelPreupload.js";
import clc from "cli-color";
import illegaltraffic_and_acident from "./controllers/illegaltraffic_and_acident.js";
// import connection from "./util/config.js";

// await startProgram();

call();
// call data
async function call() {
  // await saveJson.savetoVehiclepreupload();
  await startProgram();
}

async function startProgram() {
  let vehicleId;
  let createError = "";
  let updateError = "";
  let logError = "";
  let historyError = "";
  const PreUpload = db.vehicleVDVCPreUpload;
  const cleansingData = await readExcel();
  const arr = await PreUpload.findAll()
    .then((result) => {
      console.log(clc.red("Data have:", result.length, "records."));
      return result;
    })
    .catch((err) => {
      console.log(err);
    });

  let num = 0;
  for (let i = 0; i < arr.length; i++) {
    const vehicle = arr[i];
    const isFind = await vehicleController
      .findVehicle(vehicle.note_id_t)
      .catch((err) => {
        throw err;
      });
    if (isFind) {
      vehicleId = await vehicleController
        .updateVehicle(vehicle, cleansingData, isFind)
        .catch((err) => {
          console.log(err);
          updateError = updateError + `${vehicle.note_id_t}, ${err}\n`;
        });
    } else {
      vehicleId = await vehicleController
        .createNewVehicle(vehicle, cleansingData)
        .catch((err) => {
          console.log(err);
          createError = createError + `${vehicle.note_id_t}, ${err}\n`;
        });
    }
    // illegal Traffic
    if (vehicle.fineDate !== null) {
      await illegaltraffic_and_acident
        .createIllegaltraffic(vehicle, vehicleId)
        .then((result) => {
          if (result !== undefined) {
            //accident
            illegaltraffic_and_acident.crateAcident(vehicle, result);
          }
        });
    }

    await logController
      .craeteLog(vehicle.changelog_t, vehicleId)
      .catch((err) => {
        console.log(err);
        logError = logError + `${vehicleId}, ${err}\n`;
      });
    await historyController.createHistory(vehicleId).catch((err) => {
      console.log(err);
      historyError = historyError + `${vehicleId}, ${err}\n`;
    });
    console.log(
      clc.blue(
        `---------------------------------------------------------- Counts: ${++num}`
      )
    );
  }
  await creteErrorFile(createError, updateError, logError, historyError);
  setTimeout(() => {
    process.exit(0);
  }, 5000);
}

async function readExcel() {
  const workbook = xlsx.readFile("./files/cleansing-solr.xls");
  const workSheet = workbook.SheetNames;
  const object = {};
  await workSheet.forEach(async (sheetName) => {
    const excelData = await xlsx.utils.sheet_to_row_object_array(
      workbook.Sheets[sheetName]
    );
    const obj = {
      [sheetName]: excelData,
    };
    Object.assign(object, obj);
  });
  return object;
}

async function creteErrorFile(
  createError,
  updateError,
  logError,
  historyError
) {
  if (createError !== "") {
    await fileController
      .createErrorFile(__dirname, "Update_crete", createError, "_", "_")
      .then((result) => {
        console.log(result);
      })
      .catch((err) => {
        console.log(err);
      });
  }
  if (updateError !== "") {
    await fileController
      .createErrorFile(__dirname, "Update_update", updateError, "_", "_")
      .then((result) => {
        console.log(result);
      })
      .catch((err) => {
        console.log(err);
      });
  }
  if (logError !== "") {
    await fileController
      .createErrorFile(__dirname, "Update_log", logError, "_", "_")
      .then((result) => {
        console.log(result);
      })
      .catch((err) => {
        console.log(err);
      });
  }
  if (historyError !== "") {
    await fileController
      .createErrorFile(__dirname, "Update_history", historyError, "_", "_")
      .then((result) => {
        console.log(result);
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
