export default (sequelize, DataTypes) => {
  const IllegaTrafficAccident = sequelize.define(
    "illegal_traffic_accident",
    {
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
    },
    {
      timestamps: false,
      freezeTableName: true,
    }
  );
  return IllegaTrafficAccident;
};
