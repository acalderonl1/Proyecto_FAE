module.exports = (sequelize, Sequelize)=> {
    const Grado = sequelize.define('grado',{
        nombre: {
            type: Sequelize.STRING,
        },
        nombrecorto: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Grado
}