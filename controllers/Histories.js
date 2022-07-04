import db from "../util/database.js";
import hisFunc from "../helpers/modules/History.js";
import clc from "cli-color";
import connection from "../util/config.js";

const History = db.licenseNoHistory;
let checDP = [];

export default {
  async createHistory(vehicleId) {
    try {
      const vehicle = await hisFunc
        .getVehicle(vehicleId)
        .then((result) => {
          if (result === null) throw `No data at vehicle_id: ${vehicleId}`;
          else return result;
        })
        .catch((err) => {
          throw err;
        });
      const log = await hisFunc.getLogOnlyQuickId(vehicleId).catch((err) => {
        throw err;
      });
      // ------------------------------------------------------------------------
      if (log.length > 0) {
        for (let i = 0; i < log.length; i++) {
          const history = await hisFunc.getHistory(vehicleId).catch((err) => {
            throw err;
          });
          const quick_id = log[i].to;
          if (history.length === 0) {
            // No history at vehicle_id create new history and history_detail
            const historyData = await hisFunc.checkQuickId(
              quick_id,
              vehicle.vehicle_type_id,
              vehicleId
            );
            if (historyData) {
              let obj = {
                vehicle_id: vehicle.dataValues.id,
                vehicle_kind_code: historyData.vehicle_kind_id,
                licence_no: historyData.lice_no_number,
                province_code: historyData.lice_no_province_code,
                start_date: vehicle.dataValues.issue_date,
                end_date: vehicle.dataValues.expire_date,
                license_no_status: "uses",
              };
              await createHistory(obj, vehicle);
            } else {
              console.log(
                clc.red(
                  `quick_id at vehicle_id: ${vehicleId} is invalid -- ${quick_id}`
                )
              );
            }
          } else {
            // If have history >= 1

            const historyData = await hisFunc.checkQuickId(
              quick_id,
              vehicle.vehicle_type_id,
              vehicleId
            );
            if (historyData) {
              for (let index = 0; index < history.length; index++) {
                let license = await history[index].licence_no;
                let province = await history[index].province_code;
                let vehicle_kind = await history[index].vehicle_kind_code;
                if (
                  historyData.lice_no_number !== license &&
                  historyData.lice_no_province_code !== province &&
                  historyData.vehicle_kind_id !== vehicle_kind
                ) {
                  let obj = {
                    vehicle_id: vehicle.dataValues.id,
                    vehicle_kind_code: historyData.vehicle_kind_id,
                    licence_no: historyData.lice_no_number,
                    province_code: historyData.lice_no_province_code,
                    start_date: vehicle.dataValues.issue_date,
                    end_date: vehicle.dataValues.expire_date,
                    license_no_status: "not_uses",
                  };
                  checDP.push(obj);
                } else {
                  console.log(
                    clc.blueBright(`History licence is Already : ${license}`)
                  );
                }
              }
            } else {
              console.log(
                clc.red(
                  `quick_id at vehicle_id: ${vehicleId} is invalid -- ${quick_id}`
                )
              );
            }
          }
        }
        await reducArray(checDP);
      } else {
        let obj = {
          vehicle_id: vehicle.dataValues.id,
          vehicle_kind_code: vehicle.dataValues.vehicle_kind_code,
          licence_no: vehicle.dataValues.licence_no,
          province_code: vehicle.dataValues.province_code,
          start_date: vehicle.dataValues.issue_date,
          end_date: vehicle.dataValues.expire_date,
          license_no_status: "uses",
        };
        await createHistory(obj, vehicle);
      }
    } catch (error) {
      throw error;
    }
  },
};

// async function createHistory(historyData, vehicle) {
//   return await History.create(historyData)
//     .then(() => {
//       console.log(
//         clc.green(`Create history of vehicle_id: ${vehicle.id} success`)
//       );
//     })
//     .catch((err) => {
//       console.log(err);
//       throw `ERROR history of vehicle_id: ${vehicle.id} fail`;
//     });
// }

async function reducArray(arr) {
  const uniqueIds = [];

  const unique = arr.filter((element) => {
    const isDuplicate = uniqueIds.includes(element.licence_no);

    if (!isDuplicate) {
      uniqueIds.push(element.licence_no);

      return true;
    }
    return false;
  });

  for (let i = 0; i < unique.length; i++) {
    const element = unique[i];
    await createHistory(element);
  }

  checDP = [];
}

async function createHistory(historyData, vehicle) {
  return new Promise((resolve, reject) => {
    connection.query(
      "INSERT INTO license_no_history SET ?",
      historyData,
      function (err, result) {
        if (err) console.log(err);
        resolve(result);
        reject(err);
        if (vehicle !== undefined) {
          console.log(
            clc.green(`Create history of vehicle_id: ${vehicle.id} success`)
          );
        } else {
          console.log(clc.green(`Create history is success`));
        }
      }
    );
  });
}
