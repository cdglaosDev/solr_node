import db from "../../util/database.js";
const Vehicle = db.vehicle;
const Log = db.log;
const History = db.licenseNoHistory;

export default {
  async checkQuickId(quick_id, vehicle_type_id, vehicleId) {
    const regex = /^[\u0E80-\u0EDF]{2}?[0-9]{6,7}$/;
    const quickId = quick_id;
    // if (quickId.length >= 8 && quickId.length <= 9 && regex.test(vehicleAlphabet) && vehicle.vehicle_type_id !== null) {
    if (quickId !== null && regex.test(quickId)) {
      let vehicleKind;
      if (quickId.length === 9 && quickId.substr(-3) === "511") {
        vehicleKind = 51;
      } else {
        vehicleKind = Number(quickId.substr(6, 1));
      }
      let provinceCode;
      if (quickId.length === 9 && vehicleKind === 51) {
        provinceCode = 1;
      } else {
        if (vehicleKind === 5 && Number(quickId.substr(7)) !== "1") {
          console.log(
            `quick_id at vehicle_id: ${vehicleId} invalid -- kind = 5 but provicne != 1`
          );
          return false;
        } else {
          provinceCode = Number(quickId.substr(7));
        }
      }
      const historyData = {
        lice_no_province_code: provinceCode,
        lice_no_number: quickId
          .substr(0, 6)
          .replace(/^[\u0E80-\u0EDF]{2}/, quickId.substr(0, 2) + " "),
        vehicle_kind_id: vehicleKind,
      };
      return historyData;
    } else {
      return false;
    }
  },
  async getLogOnlyQuickId(vehicleId) {
    return await Log.findAll({
      where: { vehicle_id: vehicleId, name: "quick_id" },
    })
      .then((result) => {
        return result;
      })
      .catch((err) => {
        console.log(err);
        throw `Can not find quick_id log from vehicle_id: ${vehicleId}`;
      });
  },
  async getVehicle(vehicleId) {
    return await Vehicle.findByPk(vehicleId, {
      attributes: [
        "id",
        "quick_id",
        "vehicle_type_id",
        "owner_name",
        "village_name",
        "issue_date",
        "expire_date",
      ],
    })
      .then((result) => {
        return result === null ? null : result;
      })
      .catch((err) => {
        console.log(err);
        throw `Can not find vehicle at vehicle_id: ${vehicleId}`;
      });
  },
  async getHistory(vehicleId) {
    return await History.findAll({
      where: { vehicle_id: vehicleId },
    })
      .then((result) => {
        return result;
      })
      .catch((err) => {
        console.log(err);
        throw "Can not find history arr";
      });
  },
};
