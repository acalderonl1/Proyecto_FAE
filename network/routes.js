const { dirname } = require('path');
const path = require('path')

module.exports = function(app) {
    /* INVOCACION DE TODOS LOS CONTROLADORES */
    const Comedor = require(path.resolve(__dirname, '../components/comedor/controller.js'))
    const Grado = require(path.resolve(__dirname, '../components/grado/controller.js'))
    const Menu = require(path.resolve(__dirname, '../components/menu/controller.js'))
    const Menudia = require(path.resolve(__dirname, '../components/menudia/controller.js'))
    const Persona = require(path.resolve(__dirname, '../components/persona/controller.js'))
    const Reparto = require(path.resolve(__dirname, '../components/reparto/controller.js'))
    const Reserva = require(path.resolve(__dirname, '../components/reserva/controller.js'))
    const Rol = require(path.resolve(__dirname, '../components/rol/controller.js'))
    const Tiporancho = require(path.resolve(__dirname, '../components/tiporancho/controller.js'))
    const Unidad = require(path.resolve(__dirname, '../components/unidad/controller.js'));
    const Usuario = require(path.resolve(__dirname, '../components/usuario/controller.js'))
    const Usuarioreparto = require(path.resolve(__dirname, '../components/usuarioreparto/controller.js'))
    const Usuariorol = require(path.resolve(__dirname, '../components/usuariorol/controller.js'))
    const Procesos = require(path.resolve(__dirname, '../components/procesos/controller.js'))
    
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
    app.get('/reparto/get/:idreparto', Reparto.filter)
    app.get('/reparto/getAll', Reparto.findAll)
    app.put('/reparto/update/:idreparto', Reparto.update)
    app.delete('/reparto/delete/:idreparto', Reparto.delete)  

    /* CRUD RESERVA */
    app.post('/reserva/create', Reserva.create)
    app.get('/reserva/get/:idreserva', Reserva.filter)
    app.get('/reserva/getAll', Reserva.findAll)
    app.put('/reserva/update/:idreserva', Reserva.update)
    app.delete('/reserva/delete/:idreserva', Reserva.delete) 

    /* CRUD ROL */
    app.post('/rol/create', Rol.create)
    app.get('/rol/get/:idrol', Rol.filter)
    app.get('/rol/getAll', Rol.findAll)
    app.put('/rol/update/:idrol', Rol.update)
    app.delete('/rol/delete/:idrol', Rol.delete) 

    /* CRUD TIPOROL */
    app.post('/tiporancho/create', Tiporancho.create)
    app.get('/tiporancho/get/:idtiporancho', Tiporancho.filter)
    app.get('/tiporancho/getAll', Tiporancho.findAll)
    app.put('/tiporancho/update/:idtiporancho', Tiporancho.update)
    app.delete('/tiporancho/delete/:idtiporancho', Tiporancho.delete) 
    
    /* CRUD UNIDAD */
    app.post('/unidad/create', Unidad.create)
    app.get('/unidad/get/:idunidad', Unidad.filter)
    app.get('/unidad/getAll', Unidad.findAll)
    app.put('/unidad/update/:idunidad', Unidad.update)
    app.delete('/unidad/delete/:idunidad', Unidad.delete) 
    
    /* CRUD USUARIO */
    app.post('/usuario/create', Usuario.create)
    app.get('/usuario/get/:idusuario', Usuario.filter)
    app.get('/usuario/getAll', Usuario.findAll)
    app.put('/usuario/update/:idusuario', Usuario.update)
    app.delete('/usuario/delete/:idusuario', Usuario.delete)

    /* CRUD USUARIOREPARTO */
    app.post('/usuarioreparto/create', Usuarioreparto.create)
    app.get('/usuarioreparto/get/:idusuarioreparto', Usuarioreparto.filter)
    app.get('/usuarioreparto/getAll', Usuarioreparto.findAll)
    app.put('/usuarioreparto/update/:idusuarioreparto', Usuarioreparto.update)
    app.delete('/usuarioreparto/delete/:idusuarioreparto', Usuarioreparto.delete)

    /* CRUD USUARIOROL */
    app.post('/usuariorol/create', Usuariorol.create)
    app.get('/usuariorol/get/:idusuariorol', Usuariorol.filter)
    app.get('/usuariorol/getAll', Usuariorol.findAll)
    app.put('/usuariorol/update/:idusuariorol', Usuariorol.update)
    app.delete('/usuariorol/delete/:idusuariorol', Usuariorol.delete)
// app.get('/usuario/login/:username/:password', Procesos.filter)
  
    /* RUTAS DE PROCESOS */
    app.post('/proceso/create', Procesos.create)
    app.get('/usuario/login/:username/:password', Procesos.filter)
    app.get('/usuario/datatiporancho/:idtiporancho/:idcomedor', Procesos.menudia)
   //reserva apk movil
    app.get('/usuario/datareserva/:idreserva', Procesos.reserva)
    //reserva webCliente
    app.get('/usuario/datareservaweb', Procesos.reservaWebCliente)
    //reserva webCliente rol usuario
    app.get('/usuario/dataperfilpersonaWeb/:idperson', Procesos.perfilUserAdmin)
    //perfil Movil
    app.get('/usuario/dataperfilpersona/:idperson', Procesos.perfilUser)
    app.get('/usuario/datafactura/:idfactura', Procesos.Factura)
    app.get('/usuario/dataRestaurant_reparto/:idpersona_', Procesos.Reparto)

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
