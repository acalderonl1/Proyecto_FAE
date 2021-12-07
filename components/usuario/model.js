module.exports = (sequelize, Sequelize)=> {
    const Usuarios = sequelize.define('usuarios',{
        idusuario: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idpersona: {
            type: Sequelize.INTEGER,
        },
        username: {
            type: Sequelize.STRING,
        },
        password: {
            type: Sequelize.STRING,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        },
    },
    { timestamps: false})
    return Usuarios
}