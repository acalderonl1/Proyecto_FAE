import project from '../model/project'


export async function getOneProject(req, res){
    try{
        const { id } = req.params
        const Project = await project.findOne({
            where:{
                id
            }
        })
        res.json({
            data: Project
        })
    } catch(e){
        console.log(e)
    }
}


export async function deleteProject(req, res){
    try {
        const { id } = req.params
    const deleteRowCount = await project.destroy({
        where:{
            id
        }
    })
    res.json({
        message: 'Project deleted successfully',
        count: deleteRowCount
    })
    } catch (e) {
        console.log(e)
    }
}


export async function getProjects(req, res) {
    try {
        const projects = await project.findAll()
        res.json({
            data: projects
        })
    } catch (e) {
        console.log(e)
    }
}


export async function createProject(req, res) {
    const { name, priority, description, deliverydate } = req.body
    try {
        console.log(req.body)
        let new_project = await project.create({
            name,
            priority,
            description,
            deliverydate
        }, {
            fields: ['name', 'priority', 'description', 'deliverydate']
        })

        if (new_project) {
            return res.json({
                message: 'Project create successfully',
                data: new_project
            })
        }
    } catch (e) {
        console.log(e)
        res.status(500).json({
            message: 'Someting goes wrong',
            data: {}
        })
    }
}

export async function updateProject(req, res){
    try {
        const {id} = req.params
        const {name, priority, description, deliverydate} = req.body
        
        const Project= await project.findAll({
            attributes: [
                'id',
                'name',
                'priority',
                'description',
                'deliverydate'
            ],
            where: {
                id
            }
        })


        if(Project.length > 0){
            Project.forEach(async Project => {
                await Project.update({
                    name,
                    priority,
                    description,
                    deliverydate
                })
            });
        }
        return res.json({
            message: 'update successfully',
            data: Project
        })

    } catch (e) {
        console.log(e)
    }
}