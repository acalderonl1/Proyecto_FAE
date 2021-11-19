const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    const usuarios = require(path.resolve(__dirname,'../components/usuarios/controller.js'));


    app.post('/usuario/create', usuarios.create);
    // Login
    app.get('/usuario/login/:cedula/:contrasena', usuarios.filter);
}
