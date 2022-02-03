import React from "react";
//import css
import '../assets/css/login.css';
//import imagenes
import logo from '../assets/img/logo.png';

class login extends React.Component {

    //AQUI SE CREAN LAS VARIABLES ESTATICAS QUE REQUIERE LA API
    state = {
        form: {
            "usuario": "",
            "password": "",
        },
        error: false,
        errorMsg: ""
    }


    manejadorSubmit = e => {
        e.preventDefault();
    }


    manejadorChange = async e => {
        await this.setState({
            form: {
                ...this.state.form,
                [e.target.name]: e.target.value
            }
        })
    }


    manejadorBoton() {
        console.log("enviado")
    }


    render() {
        return (
            <React.Fragment>
                <div className="container">
                    <div className="row">
                        <div className="col-md-11 mt-60 mx-md-auto">
                            <div className="login-box bg-white pl-lg-5 pl-0">
                                <div className="row no-gutters align-items-center">
                                    <div className="col-md-6">
                                        <div className="form-wrap bg-white">
                                            <h4 align="center" className="btm-sep pb-3 mb-5">Iniciar Sesión</h4>
                                            <form onSubmit={this.manejadorSubmit} className="form" method="post">
                                                <div className="row">
                                                    <div className="col-12">
                                                        <label className="form-control-label"><b>Usuario</b></label>
                                                        <input id="usuario" type="text" className="form-control" onChange={this.manejadorChange} />
                                                    </div>
                                                    <div className="col-12">
                                                        <label className="form-control-label"><b>Contraseña</b></label>
                                                        <input id="password" type="password" className="form-control" onChange={this.manejadorChange} />
                                                    </div>

                                                    <div className="col-12 mt-40">
                                                        <input type="submit" className="btn btn-lg btn-custom btn-success btn-block" values="Guardar" onclick={this.manejadorBoton} />
                                                    </div>

                                                    <div className="col-12 mt-30">
                                                        <button type="submit" id="submit" className="btn btn-lg btn-custom btn-success btn-block">Ingresar
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div className="col-md-6">
                                        <div className="content text-center">
                                            <div className="border-bottom pb-5 mb-2">
                                                <img src={logo} alt="" />

                                            </div>
                                            <small>@Desarrolado por Abdón Calderón</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}

export default login