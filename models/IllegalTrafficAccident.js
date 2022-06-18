export default (sequelize, DataTypes) => {
  const IllegaTrafficAccident = sequelize.define("IllegaTrafficAccident", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    illegal_traffic_id: {
      type: DataTypes.INTEGER,
      alowNull: false,
    },
    traffic_accidence_id: {
      type: DataTypes.INTEGER,
      alowNull: false,
    },
  });
  return IllegaTrafficAccident;
};
