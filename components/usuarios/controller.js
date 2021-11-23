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


//get user for cedula No funcional    
exports.findOne = (req, res) => {
    Usuarios.findOne|(req.params.cedula)
    .then(usuarios => {
        if(!usuario){
            return res.status(404).json({
                msg:"cedula no encontradae" + req.body.cedula
            })
        }
        res.send(usuarios)
    }).catch(err => {
        if (err.kind == 'user_id'){
            return res.status(404).json({
                message: "cedula no encontradaw" + req.body.cedula
            })
        }
        return res.status(500).json({
            message: "cedula no encontradaq" + req.body.cedula
        })
    })
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
                        "msg": "logiado correctamente"
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