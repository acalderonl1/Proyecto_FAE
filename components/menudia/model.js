module.exports = (sequelize, Sequelize)=> {
    const Menudia = sequelize.define('menudia',{
        idmenudia: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idtiporancho: {
            type: Sequelize.INTEGER,
        },
        idmenu: {
            type: Sequelize.INTEGER,
        },
        idcomedor: {
            type: Sequelize.INTEGER,
        },
        fecha: {
            type: Sequelize.DATE,
        },
        precio:{
            type: Sequelize.DOUBLE,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Menudia
}