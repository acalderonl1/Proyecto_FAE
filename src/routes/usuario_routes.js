import { Router } from 'express'
import { createUsuario } from '../controller/usuario.controller'
const router = Router()

// /api/task
router.post('/', createUsuario)  


export default router