export default (sequelize, DataTypes) => {
  const IllegalTraffic = sequelize.define("IllegalTraffic", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    vehicle_id: {
      type: DataTypes.INTEGER,
      alowNull: false,
    },
    date: DataTypes.STRING(50),
    status: DataTypes.STRING(2),
    to_date: DataTypes.STRING(50),
    log: DataTypes.TEXT,
  });
  return IllegalTraffic;
};
