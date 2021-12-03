module.exports = (sequelize, Sequelize)=> {
    const Menudia = sequelize.define('menudia',{
        idiporancho: {
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