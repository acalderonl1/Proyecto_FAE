module.exports = (sequelize, Sequelize) => {
	const Cliente = sequelize.define('clientes', {
	  cedula: {
          type: Sequelize.STRING,
		  primaryKey: true,
      },
      nombre: {
			type: Sequelize.STRING
	  },
	  apellido: {
			type: Sequelize.STRING
      },
	  contrasena:{
		  type: Sequelize.STRING
	  }
	},
	{ timestamps: false});

	return Cliente;
}
