module.exports = (sequelize, Sequelize)=> {
    const Usuariorol = sequelize.define('usuariorol',{
        idusuario: {
            type: Sequelize.INTEGER,
        },
        idrol: {
            type: Sequelize.INTEGER,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Usuariorol
}