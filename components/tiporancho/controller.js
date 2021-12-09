const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Tiporancho = db.tiporancho


//ingresar datos a la tabla
exports.create = (req, res) => {
    Tiporancho.create({
        nombre: req.body.nombre,
        estado: req.body.estado,
        utc: req.body.utc,
    }).then(rol => {
        res.json(rol)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idtiporancho
    var filter = {}
    if (req.params.idtiporancho > 0) {
        filter = {
            where: {
                idtiporancho: id
            }
        }
    }
    Tiporancho.findAll(filter).then(tiporancho => {
        res.json(tiporancho);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Tiporancho.findAll()
        .then(tiporancho => {
            res.send(tiporancho);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Tiporancho.update({
        nombre: req.body.nombre,
        estado: req.body.estado,
        utc: req.body.utc,
    },
        {
            where: {
                idtiporancho: req.params.idtiporancho,
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
    const id = req.params.idtiporancho;
    Tiporancho.destroy({
        where: {
             idtiporancho: id 
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
