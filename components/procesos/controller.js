const path = require('path')
const { menudia } = require('../../db.config')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuario = db.usuario
const Persona = db.persona
const Grado = db.grado
const Menu = db.menu
const Menudia = db.menudia
const Comedor = db.comedor
const Tiporancho = db.tiporancho
const Reserva = db.reserva
const Reparto = db.reparto

/*ASOSIACION DE PER Y GRA*/{
    Persona.hasOne(Grado, {
        foreignKey: 'idgrado',
        sourceKey: 'idgrado',
        targetKey: 'idgrado'
    });

    Grado.belongsTo(Persona, {
        foreignKey: 'idgrado',
        sourceKey: 'idgrado',
        targetKey: 'idgrado'
    });

    Persona.hasOne(Reparto, {
        foreignKey: 'idreparto',
        sourceKey: 'idreparto',
        targetKey: 'idreparto'
    })

    Reparto.hasMany(Persona, {
        foreignKey: 'idreparto',
        sourceKey: 'idreparto',
        targetKey: 'idreparto'
    })
}

/* ASOSIACIONES DE RESERVAS */{
    Reserva.hasMany(Menudia, {
        foreignKey: 'idmenudia',
        sourceKey: 'idmenudia',
        targetKey: 'idmenudia'
    });

    Menudia.hasMany(Reserva, {
        foreignKey: 'idmenudia',
        sourceKey: 'idmenudia',
        targetKey: 'idmenudia'
    });

    Menudia.hasMany(Menu, {
        foreignKey: 'idmenu',
        sourceKey: 'idmenu',
        targetKey: 'idmenu'
    });

    Menudia.hasMany(Comedor, {
        foreignKey: 'idcomedor',
        sourceKey: 'idcomedor',
        targetKey: 'idcomedor'
    });

    Menudia.hasMany(Tiporancho, {
        foreignKey: 'idtiporancho',
        sourceKey: 'idtiporancho',
        targetKey: 'idtiporancho'

    });

    Comedor.hasMany(Menudia, {
        foreignKey: 'idcomedor',
        sourceKey: 'idcomedor',
        targetKey: 'idcomedor'

    });

    Menu.hasOne(Menudia, {
        foreignKey: 'idmenu',
        sourceKey: 'idmenu',
        targetKey: 'idmenu'
    });

    Tiporancho.hasOne(Menudia, {
        foreignKey: 'idtiporancho',
        sourceKey: 'idtiporancho',
        targetKey: 'idtiporancho'
    });
}


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
        res.json(persona)
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


/* CONSULTA ENTRE TABLAS ENTRE GRADO Y PERSONA*/
exports.consultGradoPersona = (req, res) => {
    Persona.findAll({
        where: { idpersona: req.params.idpersona },
        // attributes: ['idpersona', 'nombres'],
        include: [{
            model: Grado,
        },{model: Reparto}],
        
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


/* CONSULTA ENTRE TABLAS PARA OBTENER TODAS LAS RESERVAS DE UNA PERSONA*/
exports.consultReserva = (req, res) => {
    Reserva.findAll({
        where: {
            idpersona: req.params.idpersona
        },
        attributes: ['cantidad'],
        include: [{
            model: Menudia, attributes: ['dia', 'precio'],
            include: [{
                model: Menu, attributes: ['descripcion'],
            },
            { model: Tiporancho, attributes: ['nombre'] },
            {
                model: Comedor, attributes: ['nombre']
            }],
        }
        ],
    }).then(reserva => {
        res.json(reserva)
    }).catch(err => {
        console.log(err);
        res.status(500).json(
            {
                msg: "error", details: err
            }
        )
    })
}
