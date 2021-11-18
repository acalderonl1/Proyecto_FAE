import Sequelize from "sequelize";
import { sequelize } from '../database/database'


const m_usuario = sequelize.define('usuarios', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    usuario: {
        type: Sequelize.TEXT
    },
    contrasena: {
        type: Sequelize.BOOLEAN
    }
}, {
    timestamps: false
})

export default m_usuario