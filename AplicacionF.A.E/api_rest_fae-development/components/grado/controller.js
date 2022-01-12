const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Grado = db.grado

//ingresar datos a la tabla
exports.create = (req, res) => {
    Grado.create({
        nombre: req.body.nombre,
        nombrecorto: req.body.nombrecorto,
        utc: req.body.utc  
    }).then(grado => {
        res.json(grado)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idgrado
    var filter = {}
    if (req.params.idgrado > 0) {
        filter = {
            where: {
                idgrado: id
            }
        }
    }
    Grado.findAll(filter).then(grado => {
        res.json(grado);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla GRADO 
exports.findAll = (req, res) => {
    Grado.findAll()
        .then(grado => {
            res.send(grado);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla GRADO
exports.update = (req, res) => {
    const idgrado = req.params.idgrado;
    Grado.update({
        nombre: req.body.nombre,
        nombrecorto: req.body.nombrecorto,
        utc: req.body.utc 
    },
        {
            where: {
                idgrado: req.params.idgrado,
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
    const idgrado = req.params.idgrado;
    Grado.destroy({
        where: { idgrado: idgrado },
    }).then(() => {
        res.status(200).json({ msg: 'Registro eliminado -> Representante cedula = ' + idgrado });
    }).catch(err => {
        console.log(err);
        res.status(500).json({ msg: "error", details: err });
    });
};