import m_usuario from '../model/usuario_model'


export async function createUsuario(req, res) {
    const { usuario, constrasena } = req.body
    try {
        let new_usuario = await m_usuario.create({
            usuario,
            constrasena
        }, {
            fields: ['usuario', 'constrasena']
        })

        if (new_usuario) {
            return res.json({
                message: 'user create successfully',
                data: new_usuario
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