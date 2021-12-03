module.exports = (sequelize, Sequelize)=> {
    const Comedor = sequelize.define('comedor',{
        idreparto: {
            type: Sequelize.INTEGER,
        },
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
    return Comedor
}