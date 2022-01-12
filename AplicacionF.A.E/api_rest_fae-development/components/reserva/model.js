module.exports = (sequelize, Sequelize)=> {
    const Reserva = sequelize.define('reserva',{
        idreserva:{
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idmenudia: {
            type: Sequelize.INTEGER,
        },
        idpersona: {
            type: Sequelize.INTEGER,
        },
        estado: {
            type: Sequelize.STRING,
        },
        cantidad: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    { timestamps: false})
    return Reserva
}