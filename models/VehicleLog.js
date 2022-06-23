export default (sequelize, Sequelize) => {
  const log = sequelize.define(
    "vehicle_logs",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      vehicle_id: {
        type: Sequelize.INTEGER,
      },
      name: {
        type: Sequelize.STRING(2555),
      },
      from: {
        type: Sequelize.STRING(255),
      },
      to: {
        type: Sequelize.STRING(255),
      },
      app_request_no: {
        type: Sequelize.STRING(45),
      },
      veh_log_activity: {
        type: Sequelize.TEXT,
      },
      datetime: {
        type: Sequelize.STRING(45),
      },
    },
    {
      timestamps: false,
      freezeTableName: true,
    }
  );
  return log;
};
