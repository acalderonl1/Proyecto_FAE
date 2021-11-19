const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuarios = db.tb_usuario

//post usuarios
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
        fecha_creacion: req.body.fecha_creacion
    }).then(usuario => {
        res.json(usuario)
    }).catch(err => {
        res.status(500).json(
            {
                msg: "error",
                message: err.error[0]['message'],
                value: err.error[0]['value']
            }
        )
        console.log('mensaje controlado', err)
    })
}

// logging of the Users
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
                        "msg": "users created successfully"
                    }
                )
            } else {
                res.json(
                    {
                        "msg": "constraseña incorrecta"
                    }
                )
            }
        }else{
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