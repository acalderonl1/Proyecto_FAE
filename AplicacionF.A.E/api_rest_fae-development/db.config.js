const env = require('./env.js');
const Sequelize = require('sequelize');
// Se encarga de inicializar instancia para uso de los operadores.
const Op = Sequelize.Op

const sequelize = new Sequelize(env.database, env.username, env.password, {
  host: env.host,
  dialect: env.dialect,
  schema: env.schema,

  pool: {
    max: env.max,
    min: env.pool.min,
    acquire: env.pool.acquire,
    idle: env.pool.idle
  },


  dialectOptions: {
    socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock',
    supportBigNumbers: true,
    bigNumberStrings: true
  },
  storage: 'path/to/database.sqlite',
  omitNull: true,

  // Parámetros predeterminados de la base de datos, parámetros globales
  define: {
    underscored: false,
    freezeTableName: true,
    charset: 'utf8',
    dialectOptions: {
      collate: 'utf8_general_ci'
    },
    timestamps: true
  },
  
  // ¿Está sincronizado?
  sync: { force: true },

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

/* INVOCACION DE TODOS LOS MODELOS */
db.comedor = require('./components/comedor/model.js')(sequelize, Sequelize);
db.grado = require('./components/grado/model.js')(sequelize, Sequelize);
db.menu = require('./components/menu/model.js')(sequelize, Sequelize);
db.menudia = require('./components/menudia/model.js')(sequelize, Sequelize);
db.persona = require('./components/persona/model.js')(sequelize, Sequelize);
db.reparto = require('./components/reparto/model.js')(sequelize, Sequelize);
db.reserva = require('./components/reserva/model.js')(sequelize, Sequelize);
db.rol = require('./components/rol/model.js')(sequelize, Sequelize);
db.tiporancho = require('./components/tiporancho/model.js')(sequelize, Sequelize);
db.unidad = require('./components/unidad/model.js')(sequelize, Sequelize);
db.usuario = require('./components/usuario/model.js')(sequelize, Sequelize);
db.usuarioreparto = require('./components/usuarioreparto/model.js')(sequelize, Sequelize);
db.usuariorol = require('./components/usuariorol/model.js')(sequelize, Sequelize)

module.exports = db;
