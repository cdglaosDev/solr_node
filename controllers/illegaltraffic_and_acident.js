import db from "../util/database.js";
import Illegal_traffic from "../helpers/modules/illegal_traffic.js";
import acident from "../helpers/modules/acident.js";
import clc from "cli-color";

const illegal_traffic = db.illegalTraffic;
const accident = db.illegalTrafficAccident;
export default {
  async createIllegaltraffic(value, vehicleId) {
    let finedate = Illegal_traffic.fineDate(value)
      ? Illegal_traffic.fineDate(value)
      : null;
    let releasdate = Illegal_traffic.ReleasDate(value)
      ? Illegal_traffic.ReleasDate(value)
      : null;
    let finelog = Illegal_traffic.fineLog(value)
      ? Illegal_traffic.fineLog(value)
      : null;
    if (finedate !== null) {
      let id = "";
      await illegal_traffic
        .create({
          vehicle_id: vehicleId,
          date: finedate,
          status: 1,
          to_date: releasdate,
          log: finelog,
        })
        .then((result) => {
          id = result.dataValues.id;
        })
        .catch((err) => {
          console.log(err);
        });
      return id;
    }
  },
  async crateAcident(value, illegal_Id) {
    let data = acident.checkData(value);
    if (data.length > 0 && illegal_Id != 0) {
      for (let index = 0; index < data.length; index++) {
        await accident
          .create({
            illegal_traffic_id: illegal_Id,
            traffic_accidence_id: data[index],
          })
          .then(() => {
            console.log(clc.yellow("create Accident is Success"));
          })
          .catch((err) => {
            console.log(err);
          });
      }
    }
  },
};
