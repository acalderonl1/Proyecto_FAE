module.exports = (sequelize, Sequelize)=> {
    const Unidade = sequelize.define('unidad',{
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
    return Unidade
}