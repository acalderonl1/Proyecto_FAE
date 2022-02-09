// const path = require('path')
// const db = require(path.resolve(__dirname, '../../db.config'))
// const Usuario = db.usuario
// // const route = require('../../network/routes')

// persona = {
//     idreparto: req.body.idreparto,
//     idgrado: req.body.idgrado,
//     nombres: req.body.nombres,
//     telefono: req.body.telefono,
//     correo: req.body.correo,
//     sexo: req.body.sexo,
//     dni: req.body.dni,
//     estado: req.body.estado	
// },



// persona = {
//     "idreparto": 1,
// 	"idgrado": 1,
// 	"nombres":"gaybor tons",
// 	"telefono":"0808080808",
// 	"correo":"gtonc@gmail.com",
// 	"sexo":"M",
// 	"dni":"0989873409",
// 	"estado":"A"	
// }
// exports.create = (req, res) => {
//     Usuarios.create({
//         var opciones = {
//             method: 'POST',
//             body: JSON.stringify(persona) 
//         },

//         respuesta = fetch('http://localhost:3000/personas/create', opciones).then(res =>
//             res.json()),

//         idpersona: req.body.idpersona,
//         username: req.body.username,
//         password: req.body.password,
//         estado: req.body.estado,
//         utc: req.body.utc,        
//     }).then(usuarios => {
//         res.json(usuarios) 
//     }).catch(err => {
//         res.status(500).json({ msg: "error", mensaje: err });
//         console.log('mensaje controlado', err)
//     });
// }

// exports.findAll = (req, res) => {
//     Usuario.findAll()
//         .then(usuario => {
//             res.send(usuario);
//         }).catch(err => {
//             res.status(500).send({
//                 message: err.message || "Some error occurred while retrieving data."
//             });
//         });
// };