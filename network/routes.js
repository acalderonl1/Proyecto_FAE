const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    /* INVOCACION DE TODOS LOS CONTROLADORES */
    const Comedor = require(path.resolve(__dirname, '../components/comedor/controller.js'))
    const Grado = require(path.resolve(__dirname, '../components/grado/controller.js'))
    
    const Unidade = require(path.resolve(__dirname, '../components/unidad/controller.js'));
    const Persona = require(path.resolve(__dirname, '../components/persona/controller.js'))
    const Usuario = require(path.resolve(__dirname, '../components/usuario/controller.js'))

    /* CRUD COMEDOR */
    app.post('/comedor/create', Comedor.create)
    app.get('/comedor/get/:id', Comedor.findOne)
    app.get('/comedor/getAll', Comedor.findAll)
    app.put('/comedor/update/:id', Comedor.update)
    app.delete('/comedor/delete/:id', Comedor.delete)

    /* CRUD GRADO */
    app.post('/grado/create', Grado.create)
    app.get('/grado/get/:id', Grado.findOne)
    app.get('/grado/getAll', Grado.findAll)
    app.put('/grado/update/:id', Grado.update)
    app.delete('/grado/delete/:id', Grado.delete)

    // CRUD UNIDADES   
    app.post('/unidades/create', Unidade.create)

    // CRUD PERSONAS
    app.post('/personas/create', Persona.create)

    // CRUD USUARIOS
    // app.post('/usuarios/create', Usuarios.create)
    app.get('/usuarios/getAll', Usuario.findAll)


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
