module.exports = (sequelize, Sequelize)=> {
    const Usuarios = sequelize.define('tb_usuarios',{
        grado_id: {
            type: Sequelize.INTEGER,
        },
        rol_id: {
            type: Sequelize.INTEGER,
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
        fecha_creacion: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Usuarios
}