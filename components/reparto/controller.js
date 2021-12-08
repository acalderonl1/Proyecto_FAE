const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Reparto = db.reparto


//ingresar datos a la tabla
exports.create = (req, res) => {
    Reparto.create({
        idunidad: req.body.idunidad,
        nombre: req.body.nombre,
        codigo: req.body.codigo,
    }).then(reparto => {
        res.json(reparto)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idreparto
    var filter = {}
    if (req.params.idreparto > 0) {
        filter = {
            where: {
                idreparto: id
            }
        }
    }
    Reparto.findAll(filter).then(reparto => {
        res.json(reparto);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Reparto.findAll()
        .then(reparto => {
            res.send(reparto);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Reparto.update({
        idunidad: req.body.idunidad,
        nombre: req.body.nombre,
        codigo: req.body.codigo,
    },
        {
            where: {
                idreparto: req.params.idreparto,
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
    const id = req.params.reparto;
    Reparto.destroy({
        where: { idreparto  : id },
    }).then(() => {
        res.status(200).json({ msg: 'Registro eliminado -> Representante cedula = ' + id });
    }).catch(err => {
        console.log(err);
        res.status(500).json({ msg: "error", details: err });
    });
};
