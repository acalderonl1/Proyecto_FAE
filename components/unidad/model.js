module.exports = (sequelize, Sequelize)=> {
    const Unidades = sequelize.define('unidades',{
        idunidad: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
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
    return Unidades
}