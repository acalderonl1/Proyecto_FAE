const env = {
    database: 'db_ups',
    username: 'ups-user',
    password: 'ups12345',
    host: '186.70.101.230',
    dialect: 'postgres',
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
  };
  
  module.exports = env;