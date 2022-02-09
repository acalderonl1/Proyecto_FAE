const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'));
const Menu = db.menu

//ingresar datos a la tabla
exports.create = (req, res) => {
    Menu.create({
        descripcion: req.body.descripcion,  
    }).then(menu => {
        res.json(menu)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.filter = (req, res) => {
    const id = req.params.idmenu
    var filter = {}
    if (req.params.idmenu > 0) {
        filter = {
            where: {
                idmenu: id
            }
        }
    }
    Menu.findAll(filter).then(menu => {
        res.json(menu);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla 
exports.findAll = (req, res) => {
    Menu.findAll()
        .then(menu => {
            res.send(menu);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla
exports.update = (req, res) => {
    Menu.update({
        descripcion: req.body.descripcion
    },
        {
            where: {
                idmenu: req.params.idmenu,
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
    const idmenu = req.params.idmenu;
    Menu.destroy({
        where: { idmenu: idmenu },
    }).then(() => {
        res.status(200).json({ msg: 'Registro eliminado -> Representante cedula = ' + idmenu });
    }).catch(err => {
        console.log(err);
        res.status(500).json({ msg: "error", details: err });
    });
};