const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuarios = db.tb_usuario

//post usuarios funcional
exports.create = (req, res) => {
    Usuarios.create({
        grado_id: req.body.grado_id,
        rol_id: req.body.rol_id,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        cedula: req.body.cedula,
        unidad: req.body.unidad,
        correo: req.body.correo,
        contrasena: req.body.contrasena,
        fecha_creacion: req.body.fecha_creacion,
    }).then(usuarios => {
        res.json(usuarios)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

// [db.Op.like]: '%'+ req.params.cedula + '%'


//get user for cedula funcional    
exports.findOne = (req, res) => {
    var filter = {}
    console.log('parametros reveldes ' + req.params.cedula)
	if(req.params.cedula > 0){
		filter = {
			where: {
				cedula: req.params.cedula	   		    
			}
		}       
	}
	Usuarios.findAll(filter).then(usuarios => {
		res.json(usuarios);
  }).catch(err => {
		console.log(err);
		res.status(500).json({
			msg: "error", details: err
	  });
	});    
}


// logging the Users funcional
exports.filter = (req, res) => {
    var filter = {}
    filter = {
        where: {
            cedula: req.params.cedula
        }
    }
    Usuarios.findAll(filter).then(usuario_login => {
        if (usuario_login.length > 0) {
            if (usuario_login[0].dataValues.contrasena == req.params.contrasena) {
                res.json(
                    {
                        "msg": "1"
                    }
                )
            } else {
                res.json(
                    {
                        "msg": "constraseña incorrecta"
                    }
                )
            }
        } else {
            res.json(
                {
                    "msg": "Usuario no existe"
                }
            )
        }
    }).catch(err => {
        console.log(err);
        res.status(500).json(
            {
                msg: "error", details: err
            }
        )
    })
}


// update the users NO funcional
exports.update_user = (req, res) => {
    const Cedula = req.params.cedula;
    Usuarios.update({
        estado: req.params.estado
    },
        {
            where: {
                Cedula: req.params.cedula
            }
        })
        .then(() => {
            res.status(200).json(req.params);
        }).catch(err => {
            console.log(err);
            res.status(500).json({
                msg: "error", details: err
            });
        });
};

// find all data funcional
exports.findAll = (req, res) => {
    Usuarios.findAll()
    .then(usuarios => {
        res.send(usuarios);
    }).catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred while retrieving data."
        });
    });
};

exports.delete = (req, res) => {
	const cedula = req.params.cedula;
	Usuarios.destroy({
			where: { cedula: cedula },
		}).then(() => {
			res.status(200).json( { msg: 'Registro eliminado -> Representante cedula = ' + cedula } );
		}).catch(err => {
			console.log(err);
			res.status(500).json({msg: "error", details: err});
		});
};