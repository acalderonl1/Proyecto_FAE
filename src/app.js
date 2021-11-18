import express, { json } from'express'
import morgan from 'morgan'
// importing route
import projectRoutes from './routes/projects'
import userRoutes from './routes/usuario_routes'


const app = express();


//middleware
app.use(morgan('dev'))
app.use(json())

// Routes
app.use('/api/project', projectRoutes)
app.use('/api/user', userRoutes)


export default app