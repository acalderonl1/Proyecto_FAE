const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'));
const Menudia = db.menudia

//ingresar datos a la tabla
exports.create = (req, res) => {
    Menudia.create({
        idtiporancho: req.body.idtiporancho,
        idmenu: req.body.idmenu,
        idcomedor: req.body.idcomedor,
        dia: req.body.dia,
        precio: req.body.precio,
        estado: req.body.estado,
        utc: req.body.utc,
    }).then(menudia => {
        res.json(menudia)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idmenudia
    var filter = {}
    if (req.params.idmenudia > 0) {
        filter = {
            where: {
                idmenudia: id
            }
        }
    }
    Menudia.findAll(filter).then(menudia => {
        res.json(menudia);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Menudia.findAll()
        .then(menudia => {
            res.send(menudia);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Menudia.update({
        idtiporancho: req.body.tiporancho,
        idmenu: req.body.idmenu,
        idcomedor: req.body.idcomedor,
        dia: req.body.dia,
        precio: req.body.precio,
        estado: req.body.estado,
        utc: req.body.utc,
    },
        {
            where: {
                idmenudia: req.params.idmenudia,
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
    const idmenudia = req.params.idmenudia;
    Menudia.destroy({
        where: { idmenudia: idmenudia },
    }).then(() => {
        res.status(200).json({ msg: 'Registro eliminado -> Representante cedula = ' + idmenudia });
    }).catch(err => {
        console.log(err);
        res.status(500).json({ msg: "error", details: err });
    });
};