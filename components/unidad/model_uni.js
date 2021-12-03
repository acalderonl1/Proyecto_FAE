module.exports = (sequelize, Sequelize)=> {
    const Unidad = sequelize.define('unidad',{
        utc: {
            type: Sequelize.DATE,
        },
        nombre: {
            type: Sequelize.STRING,
        },
        codigo: {
            type: Sequelize.STRING,
        },
    },
    { timestamps: false})
    return Unidad
}