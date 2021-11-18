const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    const clientes = require(path.resolve(__dirname,'../components/cliente/controller.js'));
    const compras = require(path.resolve(__dirname,'../components/compra/controller.js'));

    // Crear un cliente
    app.post('/cliente/create', clientes.create);
    // Login
    app.get('/cliente/login/:cedula/:contrasena', clientes.filter);
    // registrar compra
    app.post('/compra/create', compras.create);
    // consulta compras por cedula
    app.get('/compra/get/:cedula', compras.filter);
    // actualiza compra por id
    app.put('/compra/update/:id_compra/:estado', compras.update);

}
