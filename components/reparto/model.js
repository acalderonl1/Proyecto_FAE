module.exports = (sequelize, Sequelize)=> {
    const Reparto = sequelize.define('reparto',{
        idreparto: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idunidad: {
            type: Sequelize.INTEGER,
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
    return Reparto
}