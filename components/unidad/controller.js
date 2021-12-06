const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Unidades = db.unidades

//post usuarios funcional
exports.create = (req, res) => {
    Unidades.create({
        utc: req.body.utc,
        nombre: req.body.nombre,
        codigo: req.body.codigo  
    }).then(unidades => {
        res.json(unidades)

    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
};