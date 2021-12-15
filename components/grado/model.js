module.exports = (sequelize, Sequelize)=> {
    const Grado = sequelize.define('grado',{
        idgrado: {
            type: Sequelize.UUID,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: Sequelize.STRING,
        },
        nombrecorto: {
            type: Sequelize.STRING,
        },
        utc: {
            type: Sequelize.DATE,
        }
    },
    {timestamps: false})
    Grado.associate = function(models){
        Grado.hasMany(models.Persona, 
        {
            as: 'idpersona'
        })
    }
    // Grado.associate = function(models){
    //     Grado.hasMany(models.Persona, {as: 'idpersona'})
    // }
    return Grado
}