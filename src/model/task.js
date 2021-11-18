import Sequelize from "sequelize";
import { sequelize } from '../database/database'


const task = sequelize.define('tasks', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: {
        type: Sequelize.TEXT
    },
    done: {
        type: Sequelize.BOOLEAN
    },
    idenproject : {
        type: Sequelize.INTEGER
    }
}, {
    timestamps: false
})

export default task