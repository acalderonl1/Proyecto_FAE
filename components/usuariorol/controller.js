const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuariorol = db.usuariorol


//ingresar datos a la tabla
exports.create = (req, res) => {
    Usuariorol.create({
        idusuario: req.body.idusuario,
        idrol: req.body.idrol,
        estado: req.body.estado,
        utc: req.body.utc,
    }).then(usuariorol => {
        res.json(usuariorol)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idusuariorol
    var filter = {}
    if (req.params.idusuariorol > 0) {
        filter = {
            where: {
                idusuariorol: id
            }
        }
    }
    Usuariorol.findAll(filter).then(rol => {
        res.json(rol);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Usuariorol.findAll()
        .then(usuariorol => {
            res.send(usuariorol);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Usuariorol.update({
        idusuario: req.body.idusuario,
        idrol: req.body.idrol,
        estado: req.body.estado,
        utc: req.body.utc,
    },
        {
            where: {
                idusuariorol: req.params.idusuariorol,
            }
        })
        .then(() => {
            res.status(200).json(req.body);
        }).catch(err => {
            console.log(err);
            res.status(500).json({
                msg: "error", details: err
            });
        });
};


//Eliminar un registro de la tabla por id
exports.delete = (req, res) => {
    const id = req.params.idusuariorol;
    Usuariorol.destroy({
        where: {
             idusuariorol: id 
            },
    }).then(() => {
        res.status(200).json({
             msg: 'Registro eliminado -> Representante cedula = ' + id 
            });
    }).catch(err => {
        console.log(err);
        res.status(500).json(
            { 
                msg: "error", details: err
        });
    });
};
