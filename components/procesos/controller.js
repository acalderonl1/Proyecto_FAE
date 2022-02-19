const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuario = db.usuario
const Persona = db.persona
const Grado = db.grado
const Reparto = db.reparto
const reserva = db.reserva
const Menudia = db.menudia
const Menu = db.menu
const comedor = db.comedor
const tiporancho = db.tiporancho
const Usuariorol = db.usuariorol
Persona.belongsTo(Reparto, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});
Reparto.hasMany(Persona, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});

comedor.belongsTo(Reparto, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});
Reparto.hasMany(comedor, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});

Persona.belongsTo(Grado, {
    foreignKey: 'idgrado',
    sourceKey: 'idgrado',
    targetKey: 'idgrado'
});

Grado.hasMany(Persona, {
    foreignKey: 'idgrado',
    sourceKey: 'idgrado',
    targetKey: 'idgrado'
});

Persona.belongsTo(Reparto, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});
Reparto.hasMany(Persona, {
    foreignKey: 'idreparto',
    sourceKey: 'idreparto',
    targetKey: 'idreparto'
});

Usuario.belongsTo(Persona, {
    foreignKey: 'idpersona',
    sourceKey: 'idpersona',
    targetKey: 'idpersona'
});

Persona.belongsTo(Usuario, {
    foreignKey: 'idpersona',
    sourceKey: 'idpersona',
    targetKey: 'idpersona'
});

Usuario.belongsTo(Usuariorol, {
    foreignKey: 'idusuario',
    sourceKey: 'idusuario',
    targetKey: 'idusuario'
});
Usuariorol.belongsTo(Usuario, {
    foreignKey: 'idusuario',
    sourceKey: 'idusuario',
    targetKey: 'idusuario'
});
reserva.hasMany(Menudia, {
    foreignKey: 'idmenudia',
    sourceKey: 'idmenudia',
    targetKey: 'idmenudia'
});

Menudia.hasMany(reserva, {
    foreignKey: 'idmenudia',
    sourceKey: 'idmenudia',
    targetKey: 'idmenudia'
});
reserva.hasMany(Persona, {
    foreignKey: 'idpersona',
    sourceKey: 'idpersona',
    targetKey: 'idpersona'
})
Persona.hasMany(reserva, {
    foreignKey: 'idpersona',
    sourceKey: 'idpersona',
    targetKey: 'idpersona'
})
Menudia.hasMany(Menu, {
    foreignKey: 'idmenu',
    sourceKey: 'idmenu',
    targetKey: 'idmenu'
});
Menudia.hasMany(comedor, {
    foreignKey: 'idcomedor',
    sourceKey: 'idcomedor',
    targetKey: 'idcomedor'
});
Menudia.hasMany(tiporancho, {
    foreignKey: 'idtiporancho',
    sourceKey: 'idtiporancho',
    targetKey: 'idtiporancho'

});

comedor.hasMany(Menudia, {
    foreignKey: 'idcomedor',
    sourceKey: 'idcomedor',
    targetKey: 'idcomedor'

});


Menu.hasOne(Menudia, {
    foreignKey: 'idmenu',
    sourceKey: 'idmenu',
    targetKey: 'idmenu'
});
tiporancho.hasOne(Menudia, {
    foreignKey: 'idtiporancho',
    sourceKey: 'idtiporancho',
    targetKey: 'idtiporancho'
});
/* INGRESO ENTRE DOS TABLAS */


exports.create = (req, res) => {
    var idPersonP;
    var username = req.body.username;
    var password = req.body.password;
    var estado = req.body.estado;
    var utc = req.body.utc;
    var idUsuarioP;
    var idrol = req.body.idrol;
    var idcomedor = req.body.idcomedor;
    var idreparto_useradmin = req.body.idreparto_useradmin;
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
        res.json(persona);

    })

    function personaCreate(idpersona, username, password, estado, utc) {
        Usuario.create({
            idpersona: idpersona,
            username: username,
            password: password,
            estado: estado,
            utc: utc,
        }).then(usuario => {
            console.log(`Usuario: ${usuario.idusuario}`);
            console.log(`Estado: ${usuario.estado}`);
            idUsuarioP = usuario.idusuario
            usuariolrolCreate(usuario.idusuario, idrol, usuario.estado, usuario.utc, idcomedor, idreparto_useradmin)
            res.json(usuario);

        }).catch(err => {
            console.log(err)
        });
    }
    function usuariolrolCreate(idusuario, idrol, estado, utc, idcomedor, idreparto_useradmin) {
        console.log(idusuario)
        console.log(estado)
        Usuariorol.create({
            idusuario: idusuario,
            idrol: idrol,
            estado: estado,
            utc: utc,
            idcomedor: idcomedor,
            idreparto_useradmin: idreparto_useradmin,
        }).then({
            //    include: [res.json(req.body)]
        }).catch(err => {
            console.log(err)
        });
    }
};


exports.filter = (req, res) => {
    Usuario.findAll({
        where: {
            username: req.params.username
        },
        include: [{
            model: Usuariorol,
        }, {
            model: Persona,
            include: [{ model: Grado }, { model: Reparto }],
        }],
    }).then(usuario_login => {
        if (usuario_login.length > 0) {
            if (usuario_login[0].dataValues.password == req.params.password) {
                res.json(
                    {
                        usuario_login,
                        "msg": "1",
                        "id_person": usuario_login[0].dataValues.idpersona,
                        "id_rol": usuario_login[0].dataValues.usuariorol.idrol,
                        "estado_rol": usuario_login[0].dataValues.usuariorol.estado,
                        "grado_persona": usuario_login[0].dataValues.persona.grado.idgrado,
                        "reparto_persona": usuario_login[0].dataValues.persona.reparto.idreparto,
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

exports.menudia = (req, res) => {
    const { Op } = require("sequelize");
    Menudia.findAll({
        where: {
            estado: 'A'
        },
        order: [
            ['dia_fecha', 'ASC'],
        ],
        include: [{
            model: Menu
        },
        {
            model: tiporancho,
            where: {
                idtiporancho: req.params.idtiporancho
            },
        },
        {
            model: comedor, where: {
                idcomedor: req.params.idcomedor
            },
        }],
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

exports.perfilUserAdmin = (req, res) => {
    const { Op } = require("sequelize");
    Usuario.findAll({
        where: {
            idpersona: req.params.idperson
        },
        include: {
            model: Usuariorol,

        },

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


exports.perfilUser = (req, res) => {
    const { Op } = require("sequelize");
    Usuario.findAll({
        where: {
            idpersona: req.params.idperson
        },
        include: {
            model: Persona,
            include: [{
                model: Reparto
            },
            { model: Grado },
            ],
        },

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


// llamado de las reservas realizadas por medio del id de la pesona
exports.reserva = (req, res) => {
    const { Op } = require("sequelize");
    reserva.findAll({
        where: {
            idpersona: req.params.idreserva,
            [Op.or]: [
                {
                    estado: 'P'
                },
                {
                    estado: 'A'
                }
            ]
        },
        include: {
            model: Menudia, attributes: ['idmenudia', 'idmenu', 'idtiporancho', 'dia', 'precio'],
            include: [{
                model: Menu, attributes: ['idmenu', 'descripcion'],
            },
            { model: tiporancho, attributes: ['idtiporancho', 'nombre'] },
            {
                model: comedor, attributes: ['nombre']
            }],
        },

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

//factura 
// llamado de las reservas realizadas por medio del id de la pesona
exports.Factura = (req, res) => {
    const { Op } = require("sequelize");
    reserva.findAll({

        where: {
            [Op.or]: [
                { idpersona: req.params.idfactura },
                { estado: 'C' }
            ]
        },
        include: {
            model: Menudia, attributes: ['idmenudia', 'idmenu', 'idtiporancho', 'dia', 'precio'],
            include: [{
                model: Menu, attributes: ['idmenu', 'descripcion'],
            },
            { model: tiporancho, attributes: ['idtiporancho', 'nombre'] },
            {
                model: comedor, attributes: ['nombre']
            }],
        },

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

// Comedor con su respectivo reparto

exports.Repartocomedor = (req, res) => {
    const { Op } = require("sequelize");
    comedor.findAll({
        where: {
            idreparto: req.params.idreparto_,
        },
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

//consultas web adminCliente
// llamado de las reservas realizadas por medio del id de la pesona
exports.reservaWebCliente = (req, res) => {
    const { Op } = require("sequelize");
    reserva.findAll({
        where: {
            [Op.or]: [
                {
                    estado: 'P'
                },
                {
                    estado: 'A'

                }
            ]
        },
        include: [{
            model: Persona, attributes: ['idpersona', 'nombres', 'correo', 'telefono', 'dni'],
            include: { model: Usuario },
        }, {
            model: Menudia, attributes: ['idmenudia', 'idmenu', 'idtiporancho', 'idcomedor', 'dia', 'precio', 'dia_fecha'],
            where: { idcomedor: 1 },
            include: [{
                model: Menu, attributes: ['idmenu', 'descripcion'],
            },
            { model: tiporancho, attributes: ['idtiporancho', 'nombre'] },
            {
                model: comedor, attributes: ['nombre']
            }],
        }],
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

exports.menudiawebCliente = (req, res) => {
    const { Op } = require("sequelize");
    comedor.findAll({
        where: {
            [Op.and]: [
                { idcomedor: req.params.idcomedor },
                { idreparto: req.params.idreparto },
                { estado: 'A' }
            ]
        },
        include: {
            model: Menudia,
            where: {
                estado: 'A'
            },
            include: [{
                model: Menu,
            }, {
                model: tiporancho
            }]
        },
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

