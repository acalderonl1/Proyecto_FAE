const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuario = db.usuario
const Persona = db.persona


//ingresar datos a la tabla
exports.create = (req, res) => {
    Usuario.create({
        idpersona: req.body.idpersona,
        username: req.body.username,
        password: req.body.password,
        estado: req.body.estado,
        utc: req.body.utc,
    }).then(usuario => {
        res.json(usuario)
    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });

    Persona.create({
        idreparto: req.body.idreparto,
        idgrado: req.body.idgrado,
        nombres: req.body.nombres,
        telefono: req.body.telefono,
        correo: req.body.correo,
        sexo: req.body.sexo,
        dni: req.body.dni,
        estado: req.body.estado,
        dni: req.body.dni,
        utc: req.body.utc,
    }).then(persona => {
        res.json(persona)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });

}


// logging the Users
exports.filter = (req, res) => {
    var filter = {}
    filter = {
        where: {
            username: req.params.username
        }
    }
    Usuario.findAll(filter).then(usuario_login => {
        if (usuario_login.length > 0) {
            if (usuario_login[0].dataValues.password == req.params.password) {
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


