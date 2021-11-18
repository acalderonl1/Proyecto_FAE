import task from '../model/task'


export async function createTask(req, res) {
    const { name, done, indenproject } = req.body
    try {
        let new_task = await task.create({
            name,
            done,
            indenproject
        }, {
            fields: ['name', 'done', 'indenproject']
        })

        if (new_task) {
            return res.json({
                message: 'Task create successfully',
                data: new_task
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

export function getTask(req, res) {

}

export function updateTask(req, res) {

}

export function deleteTask(req, res) {

}

export function getOneTask(req, res) {

}

export function getTaskByProject(req, res) {

}