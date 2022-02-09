module.exports = (sequelize, Sequelize)=> {
    const Usuarioreparto = sequelize.define('usuarioreparto',{
        idusuarioreparto: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },
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