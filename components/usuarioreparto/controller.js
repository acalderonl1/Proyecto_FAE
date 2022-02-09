const path = require('path');
const db = require(path.resolve(__dirname, '../../db.config'))
const Usuarioreparto = db.usuarioreparto


//ingresar datos a la tabla
exports.create = (req, res) => {
    Usuarioreparto.create({
        idusuario: req.body.idusuario,
        idreparto: req.body.idreparto,
        utc: req.body.utc,
    }).then(usuarioreparto => {
        res.json(usuarioreparto)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idusuarioreparto;
    var filter = {}
    if (req.params.idusuarioreparto > 0) {
        filter = {
            where: {
                idusuarioreparto: id
            }
        }
    }
    Usuarioreparto.findAll(filter).then(usuarioreparto => {
        res.json(usuarioreparto);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Usuarioreparto.findAll()
        .then(usuarioreparto => {
            res.send(usuarioreparto);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Usuarioreparto.update({
        idusuario: req.body.idusuario,
        idreparto: req.body.idreparto,
        utc: req.body.utc,
    },
        {
            where: {
                idusuarioreparto: req.params.idusuarioreparto,
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
    const id = req.params.idusuarioreparto;
    Usuarioreparto.destroy({
        where: {
            idusuarioreparto: id
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
