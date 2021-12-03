module.exports = (sequelize, Sequelize)=> {
    const Tiporancho = sequelize.define('tiporancho',{
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
    return Tiporancho
}