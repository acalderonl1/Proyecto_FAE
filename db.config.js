const env = require('./env.js');
const Sequelize = require('sequelize');
// Se encarga de inicializar instancia para uso de los operadores.
const Op = Sequelize.Op

const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,

  pool: {
    max: env.max,
    min: env.pool.min,
    acquire: env.pool.acquire,
    idle: env.pool.idle
  }

});

sequelize.authenticate().then(() => {
  console.log("Base de datos online!");
}).catch((err) => {
  console.log(err);
});

const db = {};
// objeto de operadores
db.Op = Op
db.Sequelize = Sequelize;
db.Sequelize = sequelize;

//Models/tables
db.tb_usuario = require('./components/usuarios/model.js')(sequelize, Sequelize);

module.exports = db;
