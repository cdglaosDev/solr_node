export default (sequelize, Sequelize) => {
  const history = sequelize.define(
    "license_no_history",
    {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      vehicle_id: {
        type: Sequelize.INTEGER,
        autoIncrement: false,
      },
      vehicle_kind_code: {
        type: Sequelize.STRING(10),
      },
      licence_no: {
        type: Sequelize.STRING(10),
      },
      province_code: {
        type: Sequelize.STRING(10),
      },
      start_date: {
        type: Sequelize.DATE,
      },
      end_date: {
        type: Sequelize.DATE,
      },
      license_no_status: Sequelize.STRING(15),
    },
    {
      timestamps: false,
      freezeTableName: true,
    }
  );
  return history;
};
