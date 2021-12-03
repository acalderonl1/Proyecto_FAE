module.exports = (sequelize, Sequelize)=> {
    const Usuarioreparto = sequelize.define('usuarioreparto',{
        idusuario: {
            type: Sequelize.INTEGER,
        },
        idreparto: {
            type: Sequelize.INTEGER,
        },
        utc: {
            type: Sequelize.DATE,
        },
    },
    { timestamps: false})
    return Usuarioreparto
}