const Usuario = require('../usuario/model')

module.exports = (sequelize, Sequelize)=> {
    const Persona = sequelize.define('persona',{
        idpersona: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idreparto: {
            type: Sequelize.INTEGER,
        },
        idgrado: {
            type: Sequelize.INTEGER,
        },
        nombres: {
            type: Sequelize.STRING,
        },
        telefono: {
            type: Sequelize.STRING,
        },
        correo: {
            type: Sequelize.STRING,
        },
        sexo: {
            type: Sequelize.STRING,
        },
        dni: {
            type: Sequelize.STRING,
        },
        estado: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
        
    },
    { timestamps: false})
    
    return Persona
}
  

