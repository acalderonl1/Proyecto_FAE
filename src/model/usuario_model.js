import Sequelize from "sequelize";
import { sequelize } from '../database/database'


const m_usuario = sequelize.define('usuarios', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    usario: {
        type: Sequelize.TEXT
    },
    constrasena: {
        type: Sequelize.BOOLEAN
    }
}, {
    timestamps: false
})

export default m_usuario