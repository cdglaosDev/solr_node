import xlsx from "xlsx";
import db from "./util/database.js";
import vehicleController from "./controllers/Vehicles.js";
import logController from "./controllers/Logs.js";
import historyController from "./controllers/Histories.js";
import fileController from "./controllers/File.js";
import clc from "cli-color";
import illegaltraffic_and_acident from "./controllers/illegaltraffic_and_acident.js";
import schedule from "node-schedule";

function Clock_time(h, m, s) {
  return new Promise((resolve, reject) => {
    const rule = new schedule.RecurrenceRule();
    rule.dayOfWeek = [0, new schedule.Range(0, 6)];
    rule.hour = h;
    rule.minute = m;
    rule.second = s;
    schedule.scheduleJob(rule, function () {
      resolve("start system !!");
    });
  });
}

StartVehicles();
StartLicense_History();
StartTraffic_accident();

// update data
function StartVehicles() {
  Clock_time(07, 10, 10).then((result) => {
    console.log(result);
    startProgram();
  });
}

// create history
function StartLicense_History() {
  Clock_time(11, 10, 10).then(async (result) => {
    console.log("wait amoment");
    const PreUpload = db.vehicleVDVCPreUpload;
    const arr = await PreUpload.findAll()
      .then((result) => {
        console.log(clc.red("Data have:", result.length, "records."));
        return result;
      })
      .catch((err) => {
        console.log(err);
      });
    if (arr.length !== 0) {
      for (let i = 0; i < arr.length; i++) {
        const vehicle = arr[i];
        const isFind = await vehicleController
          .findVehicle(vehicle.note_id_t, vehicle.chassis_no_t)
          .catch((err) => {
            throw err;
          });
        if (isFind) {
          await historyController.createHistory(isFind).catch((err) => {
            console.log(err);
            process.exit(0);
          });
          console.log(
            clc.blue(
              `---------------------------------------------------------- Counts: ${i}`
            )
          );
        } else {
          console.log(clc.red("Not Vehicles"));
        }
      }
      console.log("just moment awit other process");
    } else {
      console.log("Vehicles preupload is not have data");
    }
  });
}

// create traffic
function StartTraffic_accident() {
  Clock_time(13, 10, 10).then(async (result) => {
    const PreUpload = db.vehicleVDVCPreUpload;
    const arr = await PreUpload.findAll()
      .then((result) => {
        console.log(clc.red("Data have:", result.length, "records."));
        return result;
      })
      .catch((err) => {
        console.log(err);
      });
    if (arr.length !== 0) {
      for (let i = 0; i < arr.length; i++) {
        const vehicle = arr[i];
        const isFind = await vehicleController
          .findVehicle(vehicle.note_id_t, vehicle.chassis_no_t)
          .catch((err) => {
            throw err;
          });
        if (isFind) {
          // illegal Traffic
          if (vehicle.finedate_t !== null) {
            // illegal traffic and accident
            let traffic_Id = await illegaltraffic_and_acident
              .createIllegaltraffic(vehicle, isFind)
              .then((result) => {
                if (result != undefined) {
                  return result;
                }
              })
              .catch((err) => {
                console.log(err);
                process.exit(0);
              });
            // create accident
            if (traffic_Id) {
              await illegaltraffic_and_acident.crateAcident(
                vehicle,
                traffic_Id
              );
            }
            console.log(
              clc.blue(
                `---------------------------------------------------------- Counts: ${i}`
              )
            );
          }
        } else {
          console.log(clc.red("Not Vehicles"));
        }
      }
      console.log("just moment awit other process");
    } else {
      console.log("Vehicles preupload is not have data");
    }
  });
}

async function startProgram() {
  let vehicleId;
  let createError = "";
  let updateError = "";
  let logError = "";
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
  if (arr.length !== 0) {
    let num = 0;
    for (let i = 0; i < arr.length; i++) {
      const vehicle = arr[i];
      const isFind = await vehicleController
        .findVehicle(vehicle.note_id_t, vehicle.chassis_no_t)
        .catch((err) => {
          throw err;
        });
      if (isFind) {
        vehicleId = await vehicleController
          .updateVehicle(vehicle, cleansingData, isFind)
          .catch((err) => {
            console.log(err);
            updateError = updateError + `${vehicle.note_id_t}, ${err}\n`;
            process.exit(0);
          });
      } else {
        vehicleId = await vehicleController
          .createNewVehicle(vehicle, cleansingData)
          .catch((err) => {
            console.log(err);
            createError = createError + `${vehicle.note_id_t}, ${err}\n`;
            process.exit(0);
          });
      }

      await logController
        .craeteLog(vehicle.changelog_t, vehicleId)
        .catch((err) => {
          console.log(err);
          logError = logError + `${vehicleId}, ${err}\n`;
          process.exit(0);
        });
      console.log(
        clc.blue(
          `---------------------------------------------------------- Counts: ${++num}`
        )
      );
    }
    console.log("just moment awit other process");
  } else {
    console.log("Vehicles preupdate is not data");
  }

  // await creteErrorFile(createError, updateError, logError, historyError);
  // setTimeout(() => {
  //   process.exit(0);
  // }, 5000);
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
