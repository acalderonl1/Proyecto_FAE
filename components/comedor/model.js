module.exports = (sequelize, Sequelize)=> {
    const Comedor = sequelize.define('comedor',{
        idcomedor: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
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
        },
        id_grado_bajo: {
            type: Sequelize.INTEGER,
        }, id_grado_alto: {
            type: Sequelize.INTEGER,
        }
    },
    { timestamps: false})
    return Comedor
}