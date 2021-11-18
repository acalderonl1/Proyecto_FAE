import express, { json } from'express'
import morgan from 'morgan'
// importing route
import projectRoutes from './routes/projects'
import taskRoutes from './routes/tasks'


const app = express();


//middleware
app.use(morgan('dev'))
app.use(json())

// Routes
app.use('/api/project', projectRoutes)
app.use('/api/task', taskRoutes)


export default app