module.exports = (sequelize, Sequelize) => {
	const Compras = sequelize.define('compras', {
      fecha_compra: {
	      type: Sequelize.DATE
	  },
	  fecha_entrega: {
		  type: Sequelize.DATE
	  },
	  courier: {
		  type: Sequelize.STRING
	  },
	  tracking: {
		  type: Sequelize.STRING
	  },
	  costo_compra: {
		  type: Sequelize.DECIMAL
	  },
	  detalle: {
		  type: Sequelize.STRING
	  },
	  observacion: {
		  type: Sequelize.STRING
	  },
	  factura: {
		  type: Sequelize.STRING
	  },
	  id_cliente: {
		  type: Sequelize.STRING
	  },
	  estado: {
		  type: Sequelize.STRING
	  }
	},
	{ timestamps: false}
	);
	return Compras;
}
