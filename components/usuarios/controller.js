const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuarios = db.tb_usuario

//post usuarios funcional
exports.create = (req, res) => {
    Usuarios.create({
        grado: req.body.grado,
        rol: req.body.rol,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        cedula: req.body.cedula,
        unidad: req.body.unidad,
        correo: req.body.correo,
        contrasena: req.body.contrasena,
        codigo: req.body.codigo,
        fecha_creacion: req.body.fecha_creacion,
        fecha_reserva: req.body.fecha_reserva,
        fecha_entrega: req.body.fecha_entrega
    }).then(usuarios => {
        res.json(usuarios)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//get user for cedula funcional    
exports.findOne = (req, res) => {
    var filter = {}
    console.log('parametros reveldes ' + req.params.cedula)
    if (req.params.cedula > 0) {
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


// update the users funcional
exports.update_user = (req, res) => {
    const cedula = req.params.cedula;
    Usuarios.update({
        grado: req.body.grado,
        rol: req.body.rol,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        cedula: req.body.cedula,
        unidad: req.body.unidad,
        correo: req.body.correo,
        contrasena: req.body.contrasena,
        codigo: req.body.codigo,
        fecha_creacion: req.body.fecha_creacion,
        fecha_reserva: req.body.fecha_reserva,
        fecha_entrega: req.body.fecha_entrega
    },
        {
            where: {
                cedula: req.params.cedula
            }
        })
        .then(() => {
            res.status(200).json({app});
            return app
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

// delete a user for cedula
exports.delete = (req, res) => {
    const cedula = req.params.cedula;
    Usuarios.destroy({
        where: { cedula: cedula },
    }).then(() => {
        res.status(200).json({ msg: 'Registro eliminado -> Representante cedula = ' + cedula });
    }).catch(err => {
        console.log(err);
        res.status(500).json({ msg: "error", details: err });
    });
};