import { Router } from 'express'
import { createTask } from '../controller/task.controller'
const router = Router()

// /api/task
router.post('/', createTask)  


export default router