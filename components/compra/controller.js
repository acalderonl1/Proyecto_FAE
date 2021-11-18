const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config.js'))
const Compra = db.compras;

// compra crear
exports.create = (req, res) => {
	Compra.create(req.body).then(compra => {
			res.json(compra);
	}).catch(err => {
			console.log(err);
			res.status(500).json({
				msg: "error", mensaje: err.errors[0]['message'], value: err.errors[0]['value']
			});
	});
};


// Listar compras que coincidan con los caracteres ingresados para el numero de identificación.
exports.filter = (req, res) => {
	var filter = {}
	if(req.params.cedula > 0){
		filter = {
			where: {
				id_cliente: {
					[db.Op.like]: '%'+ req.params.cedula + '%'
	   		}
			}
		}
	}
	Compra.findAll(filter).then(compras => {
		res.json(compras);
  }).catch(err => {
		console.log(err);
		res.status(500).json({
			msg: "error", details: err
	  });
	});
};


// Actualiza el estado de la compra por id de compra.
exports.update = (req, res) => {
	const id = req.params.id_compra;
	Compra.update({
		estado: req.params.estado
	},
	{
		where: {
			id: req.params.id_compra
		}
	})
	.then(() => {
		res.status(200).json( req.params );
	}).catch(err => {
		console.log(err);
		res.status(500).json({
			msg: "error", details: err
		});
	});
};


// Elimina por ID
exports.delete = (req, res) => {
	const id = req.params.id;
	Compra.destroy({
			where: { id: id }
		}).then(() => {
			res.status(200).json( { msg: 'Registro eliminado -> Representante Id = ' + id } );
		}).catch(err => {
			console.log(err);
			res.status(500).json({msg: "error", details: err});
		});
};
