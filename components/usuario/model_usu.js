module.exports = (sequelize, Sequelize)=> {
    const Usuario = sequelize.define('usuario',{
        idpersona: {
            type: Sequelize.INTEGER,
        },
        username: {
            type: Sequelize.STRING,
        },
        password: {
            type: Sequelize.STRING,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        },
    },
    { timestamps: false})
    return Usuario
}