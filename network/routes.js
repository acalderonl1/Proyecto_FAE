const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    const Unidades = require(path.resolve(__dirname, '../components/unidad/controller.js'));

    app.post('/unidades/create', Unidades.create)

    // created user
    // app.post('/usuario/create', usuarios.create);
    // // Login
    // app.get('/usuario/login/:cedula/:contrasena', usuarios.filter);
    // // update user for cedula
    // app.put('/usuario/update/:cedula', usuarios.update_user);
    // // get for cedula
    // app.get('/usuario/findOne/:cedula', usuarios.findOne);
    // // get all users
    // app.get('/usuario/getAll', usuarios.findAll);
    // // delete one user
    // app.delete('/usuario/delete/:cedula', usuarios.delete)
    // //Update for nombre
    // app.put('/usuario/update_correo/:correo', usuarios.update_correo);
}
