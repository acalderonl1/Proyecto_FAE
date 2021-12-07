const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Comedor = db.comedor

//ingresar datos a la tabla
exports.create = (req, res) => {
    Comedor.create({
        idreparto: req.body.idreparto,
        nombre: req.body.nombre,
        estado: req.body.estado,
        utc: req.body.utc  
    }).then(unidades => {
        res.json(unidades)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};

//consultar datos por el id
exports.findOne = (req, res) => {
    var filter = {}
    if (req.params.idcomedor > 0) {
        filter = {
            where: {
                idcomedor: req.params.idcomedor
            }
        }
    }
    Comedor.findAll(filter).then(comedor => {
        res.json(comedor);
    }).catch(err => {
        console.log(err);
        res.status(500).json({
            msg: "error", details: err
        });
    });
}

// Consultar todos los datos de la tabla comedor 
exports.findAll = (req, res) => {
    Comedor.findAll()
        .then(comedor => {
            res.send(comedor);
        }).catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving data."
            });
        });
};

//Actualizar todos los datos de la tabla comedor
exports.update = (req, res) => {
    
    Comedor.update({
        idreparto: req.body.idreparto,
        nombre: req.body.nombre,
        estado: req.body.estado,
        utc: req.body.utc
    },
        {
            where: {
                idcomedor: req.params.idcomedor
            }
        })
        .then(() => {
            res.status(200).json(req.params);
        }).catch(err => {
            console.log(err);
            res.status(500).json({
                msg: "error", details: err
            });
        });
};


//Eliminar un registro de la tabla por id
exports.delete = (req, res) => {
	const idcomedor = req.params.idcomedor;
	Comedor.destroy({
			where: { idcomedor: idcomedor },
		}).then(() => {
			res.status(200).json( { msg: 'Registro eliminado -> Representante Id = ' + idcomedor } );
		}).catch(err => {
			console.log(err);
			res.status(500).json({msg: "error", details: err});
		});
};