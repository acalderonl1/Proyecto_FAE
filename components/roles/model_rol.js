module.exports = (sequelize, Sequelize)=> {
    const Rol = sequelize.define('rol',{
        nombre: {
            type: Sequelize.STRING,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Rol
}