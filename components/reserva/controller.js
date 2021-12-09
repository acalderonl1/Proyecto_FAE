const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Reserva = db.reserva


//ingresar datos a la tabla
exports.create = (req, res) => {
    Reserva.create({
        idmenudia: req.body.idmenudia,
        idpersona: req.body.idpersona,
        estado: req.body.estado,
        cantidad: req.body.cantidad,
        utc: req.body.utc,
    }).then(reserva => {
        res.json(reserva)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idreserva
    var filter = {}
    if (req.params.idreserva > 0) {
        filter = {
            where: {
                idreserva: id
            }
        }
    }
    Reserva.findAll(filter).then(reserva => {
        res.json(reserva);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Reserva.findAll()
        .then(reserva => {
            res.send(reserva);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Reserva.update({
        idmenudia: req.body.idmenudia,
        idpersona: req.body.idpersona,
        estado: req.body.estado,
        cantidad: req.body.cantidad,
        utc: req.body.utc,
    },
        {
            where: {
                idreserva: req.params.idreserva,
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
    const id = req.params.idreserva;
    Reserva.destroy({
        where: { idreserva: id },
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
