import { Router } from 'express'
import { createProject, deleteProject, getOneProject, getProjects, updateProject } from '../controller/project.controller'
const router = Router()


//  /api/project
router.post('/', createProject)
router.get('/', getProjects)

//  /api/project/:idproject
router.get('/:id', getOneProject)
router.delete('/:id', deleteProject)
router.put('/:id', updateProject)

export default router