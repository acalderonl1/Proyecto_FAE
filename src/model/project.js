import Sequelize from 'sequelize'
import { sequelize } from '../database/database'
import task from './task'

const project = sequelize.define('projects', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: {
        type: Sequelize.TEXT
    },
    priority: {
        type: Sequelize.INTEGER
    },
    description: {
        type: Sequelize.TEXT
    },
    deliverydate: {
        type: Sequelize.DATE
    } 

}, {
    timestamps: false
})

project.hasMany(task, {foreingKey: 'idenproject', souceKey: 'id'})
task.belongsTo(project, {foreingKey: 'idenproject', souceKey: 'id'})

export default project