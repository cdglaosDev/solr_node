import db from "../util/database.js";
import cleansing from "../helpers/modules/Cleansing.js";
// import func from '../helpers/index.js'
import clc from "cli-color";
import connection from "../util/config.js";

const Vehicle = db.vehicle;
const VehicleVdvc = db.vehicleVDVC;

export default {
  async findVehicleByNumber(number) {
    return await VehicleVdvc.findAll({ where: { number: number } })
      .then(async (result) => {
        if (result.length === 0) {
          return false;
        } else {
          return result[0];
        }
      })
      .catch((err) => {
        console.log(err);
        throw `Error when find Vehicle at note_id: ${noteId}`;
      });
  },
  async findVehicle(noteId, chassis) {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT id FROM `vehicles` WHERE note_id = N'" +
          noteId +
          "' and chassis_no = N'" +
          chassis +
          "' ",
        (err, result) => {
          if (result.length === 0) {
            resolve(false);
          } else {
            resolve(result[0].id);
          }
          reject(err);
        }
      );
    });
    // return await Vehicle.findAll({
    //   where: { note_id: noteId },
    //   attributes: ["id"],
    // })
    //   .then(async (result) => {
    //     if (result.length === 0) {
    //       return false;
    //     } else {
    //       return result[0].id;
    //     }
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //     throw `Error when find Vehicle at note_id: ${noteId}`;
    //   });
  },
  async createNewVehicle(vehicle, cleansingData) {
    return await getCleansing(vehicle, cleansingData)
      .then(async (data) => {
        return new Promise((resolve, reject) => {
          connection.query(
            "INSERT INTO vehicles SET ?",
            data,
            (err, result) => {
              if (err) {
                reject(err);
              } else {
                console.log(clc.green("Create new vehicle success"));
                resolve(result.insertId);
              }
            }
          );
        });
        // return await Vehicle.create(data)
        //   .then((result) => {
        //     console.log(clc.green("Create new vehicle success"));
        //     return result.id;
        //   })
        //   .catch((err) => {
        //     console.log(err);
        //     process.exit(0);
        //     // throw "Error to crete new vehicle";
        //   });
      })
      .catch((err) => {
        throw err;
      });
  },
  async updateVehicle(vehicle, cleansingData, id) {
    return await getCleansing(vehicle, cleansingData)
      .then(async (data) => {
        return new Promise(async (resolve, reject) => {
          connection.query(
            "UPDATE `vehicles` SET ? WHERE id =" + id + "",
            data,
            (err, result) => {
              if (err) {
                reject(err);
              } else {
                console.log(clc.yellow("Update vehicle success"));
                resolve(id);
              }
            }
          );
        });
        // return await Vehicle.update(data, { where: { id: id } })
        //   .then(() => {
        //     console.log(clc.yellow("Update vehicle success"));
        //     return id;
        //   })
        //   .catch((err) => {
        //     console.log(err);
        //     process.exit(0);
        //     // throw "Error to update vehicle";
        //   });
      })
      .catch((err) => {
        throw err;
      });
  },
};

async function getCleansing(vehicle, cleansingData) {
  return await cleansing
    .cleansingData(vehicle, cleansingData)
    .then((result) => {
      return result;
    })
    .catch((err) => {
      throw err;
    });
}
