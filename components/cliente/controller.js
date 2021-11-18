const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config.js'))
const Cliente = db.clientes;

// Post cliente
exports.create = (req, res) => {
	Cliente.create({cedula: req.body.cedula,
	nombre: req.body.nombre,
	apellido: req.body.apellido,
	contrasena: req.body.contrasena,
	}).then(cliente => {
		res.json(cliente)
		}).catch(err => {
			res.status(500).json({msg: "error", mensaje: err.errors[0]['message'], value: err.errors[0]['value']  });
			console.log('mensaje controlado' , err)
		});
};

// Login cliente.
exports.filter = (req, res) => {
	var filter = {}
		filter = {where: {cedula: req.params.cedula}}
	Cliente.findAll(filter).then(cliente_login => {
		if(cliente_login.length > 0){
			if(cliente_login[0].dataValues.contrasena == req.params.contrasena){
		        res.json({"msg":"1"});
			}
			else{
			res.json({"msg":"Contrasena incorrecta"})
			}
		}
		else{
			res.json({"msg":"Cliente no existe"})
		}
	}).catch(err => {
		console.log(err);
		res.status(500).json({msg: "error", details: err});
	});
};
