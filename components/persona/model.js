const path = require('path')
const Usuario = require('../usuario/model')
const db = require(path.resolve(__dirname, '../../db.config'))

const Grado = require('../grado/model')

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
    {timestamps: false});
    Persona.associate = function(models){
        Persona.belongsTo(models.Grado, {
            as: 'idpersona',
            foreignKey: 'idgrado'
        });
    }
        // Persona.associate = function(models){
        //     Persona.belongsTo(models.Grado, {foreignKey: 'idgrado', as: 'idgrado'});
        // }
    
    return Persona
}
  

