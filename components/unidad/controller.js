const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Unidad = db.unidad


//ingresar datos a la tabla
exports.create = (req, res) => {
    Unidad.create({
        utc: req.body.utc,
        nombre: req.body.nombre,
        codigo: req.body.codigo  
    }).then(unidad => {
        res.json(unidad)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idunidad
    var filter = {}
    if (req.params.idunidad > 0) {
        filter = {
            where: {
                idunidad: id
            }
        }
    }
    Unidad.findAll(filter).then(unidad => {
        res.json(unidad);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Unidad.findAll()
        .then(unidad => {
            res.send(unidad);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Unidad.update({
        utc: req.body.utc,
        nombre: req.body.nombre,
        codigo: req.body.codigo 
    },
        {
            where: {
                idunidad: req.params.idunidad,
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
    const id = req.params.idunidad;
    Unidad.destroy({
        where: {
             idunidad: id 
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
