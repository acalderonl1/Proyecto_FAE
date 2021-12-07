const path = require('path')
const db = require(path.resolve(__dirname, '../../db.config'))
const Personas = db.personas


//post personas 
exports.create = (req, res) => {
    Personas.create({
        idreparto: req.body.idreparto,
        idgrado: req.body.idgrado,
        nombres: req.body.nombres,
        telefono: req.body.telefono,
        correo: req.body.correo,
        sexo: req.body.sexo,
        dni: req.body.dni,
        estado: req.body.estado,
        dni: req.body.dni,         
    }).then(personas => {
        res.json(personas)
    }).catch(err => {
        res.status(500).json({ msg: "error", mensaje: err });
        console.log('mensaje controlado', err)
    });
    
};
