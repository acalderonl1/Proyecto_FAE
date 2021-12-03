module.exports = (sequelize, Sequelize)=> {
    const Menu = sequelize.define('menu',{
        dscripcion: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Menu
}