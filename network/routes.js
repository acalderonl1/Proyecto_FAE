const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    /* INVOCACION DE TODOS LOS CONTROLADORES */
    const Comedor = require(path.resolve(__dirname, '../components/comedor/controller.js'))
    const Grado = require(path.resolve(__dirname, '../components/grado/controller.js'))
    const Menu = require(path.resolve(__dirname, '../components/menu/controller.js'))
    const Menudia = require(path.resolve(__dirname, '../components/menudia/controller.js'))
    const Reparto = require(path.resolve(__dirname, '../components/reparto/controller.js'))

    const Unidade = require(path.resolve(__dirname, '../components/unidad/controller.js'));
    const Persona = require(path.resolve(__dirname, '../components/persona/controller.js'))
    const Usuario = require(path.resolve(__dirname, '../components/usuario/controller.js'))

    /* CRUD COMEDOR */
    app.post('/comedor/create', Comedor.create)
    app.get('/comedor/get/:idcomedor', Comedor.filter)
    app.get('/comedor/getAll', Comedor.findAll)
    app.put('/comedor/update/:idcomedor', Comedor.update)
    app.delete('/comedor/delete/:idcomedor', Comedor.delete)

    /* CRUD GRADO */
    app.post('/grado/create', Grado.create)
    app.get('/grado/get/:idgrado', Grado.filter)
    app.get('/grado/getAll', Grado.findAll)
    app.put('/grado/update/:idgrado', Grado.update)
    app.delete('/grado/delete/:idgrado', Grado.delete)

    /* CRUD MENU */
    app.post('/menu/create', Menu.create)
    app.get('/menu/get/:idmenu', Menu.filter)
    app.get('/menu/getAll', Menu.findAll)
    app.put('/menu/update/:idmenu', Menu.update)
    app.delete('/menu/delete/:idmenu', Menu.delete)

    /* CRUD MENUDIA */
    app.post('/menudia/create', Menudia.create)
    app.get('/menudia/get/:idmenudia', Menudia.filter)
    app.get('/menudia/getAll', Menudia.findAll)
    app.put('/menudia/update/:idmenudia', Menudia.update)
    app.delete('/menudia/delete/:idmenudia', Menudia.delete)

    /* CRUD PERSONAS */
    app.post('/persona/create', Persona.create)
    app.get('/persona/get/:idpersona', Persona.filter)
    app.get('/persona/getAll', Persona.findAll)
    app.put('/persona/update/:idpersona', Persona.update)
    app.delete('/persona/delete/:idpersona', Persona.delete)
    
    /* CRUD REPARTO */
    app.post('/reparto/create', Reparto.create)
    app.get('/reparto/get/:idpersona', Reparto.filter)
    app.get('/reparto/getAll', Reparto.findAll)
    app.put('/reparto/update/:idpersona', Reparto.update)
    app.delete('/reparto/delete/:idpersona', Reparto.delete)  


    // CRUD UNIDADES   
    // app.post('/unidades/create', Unidade.create)

    

    // CRUD USUARIOS
    // app.post('/usuarios/create', Usuarios.create)
    // app.get('/usuarios/getAll', Usuario.findAll)


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
