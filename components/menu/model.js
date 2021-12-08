module.exports = (sequelize, Sequelize)=> {
    const Menu = sequelize.define('menu',{
        idmenu: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        descripcion: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Menu
}