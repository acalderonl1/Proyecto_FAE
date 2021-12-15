const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuario = db.usuario
const Persona = db.persona
const Grado = db.grado

Persona.hasOne(Grado, {
    foreignKey: {
        name: 'idgrado',
        allowed: false,
    }
});

Grado.hasOne(Persona, { foreignKey: 'idgrado' });

/* INGRESO ENTRE DOS TABLAS */
exports.create = (req, res) => {
    var idPersonP;
    var username = req.body.username;
    var password = req.body.password;
    var estado = req.body.estado;
    var utc = req.body.utc;
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
        idPersonP = persona.idpersona
        personaCreate(persona.idpersona, username, password, estado, utc)
        
    }
    )

    function personaCreate(idpersona, username, password, estado, utc) {
        console.log(idpersona)
        Usuario.create({
            idpersona: idpersona,
            username: username,
            password: password,
            estado: estado,
            utc: utc,
        }).then({
            include: [res.json(req.body)]
        }).catch(err => {
            console.log(err)
        });
    }
};



/* INICIO DE SESION */
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

/* CONSULTA ENTRE TABLAS */
exports.consult = (req, res) => {
    Persona.findAll({
        // attributes: ['nombres'],
        where: { idpersona: req.params.idpersona },
        attributes: ['nombres'],
        include: [{ model: Grado, attributes: ['nombrecorto'] }]
    }).then(grado => {
        res.json(grado)
    }).catch(err => {
        console.log(err);
        res.status(500).json(
            {
                msg: "error", details: err
            }
        )
    })

}
