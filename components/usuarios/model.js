module.exports = (sequelize, Sequelize)=> {
    const Usuarios = sequelize.define('tb_usuarios',{
        grado: {
            type: Sequelize.STRING,
        },
        rol: {
            type: Sequelize.STRING,
        },
        nombre: {
            type: Sequelize.STRING,
        },
        apellido: {
            type: Sequelize.STRING,
        },
        cedula: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        unidad: {
            type: Sequelize.STRING,
        },
        correo: {
            type: Sequelize.STRING,
        },
        contrasena: {
            type: Sequelize.STRING,
        },
        codigo: {
            type: Sequelize.STRING,
        },
        fecha_creacion: {
            type: Sequelize.DATE,
        },
        fecha_reserva: {
            type: Sequelize.DATE,
        },
        fecha_entrega: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Usuarios
}