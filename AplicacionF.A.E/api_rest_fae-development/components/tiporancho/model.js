module.exports = (sequelize, Sequelize)=> {
    const Tiporancho = sequelize.define('tiporancho',{
        idtiporancho: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
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
    return Tiporancho
}