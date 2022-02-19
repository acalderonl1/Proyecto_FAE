import React from "react";
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import '../assets/css/nuevo.css';
import { registerLocale } from "react-datepicker";
import es from 'date-fns/locale/es';
import axios from "axios";
import Navbar from '../assets/nav/navCliente'


registerLocale('es', es)
class nuevo extends React.Component {
    state = {
        fecha: new Date(),
        tiporancho: [],
        menu: []
    }

    componentDidMount() {
        axios.get("http://localhost:3000/tiporancho/getAll")
            .then((response) => {
                console.log(response);
                this.setState({ tiporancho: response.data })
            }).catch((error) => {
                console.log(error);
            })
        axios.get("http://localhost:3000/menu/getAll")
            .then((response) => {
                console.log(response);
                this.setState({ menu: response.data })
            }).catch((error) => {
                console.log(error);
            })
    }


    onChange = fecha => {
        this.setState({ fecha: fecha });
    }

    mostrarFecha = fecha => {
        const options = { weekday: 'long' };
        alert(fecha.toLocaleDateString('es-ES', options));
    }

    render() {
        return (
            <><Navbar />
                <div className="">
                    <div className="center">
                        <DatePicker locale="es" dateFormat="dd 'de' MMMM 'de' yyyy" selected={this.state.fecha} onChange={this.onChange} />
                        <br /><br />

                        <input type="button" value="Mostrar Fecha" className="btn btn-primary" onClick={() => this.mostrarFecha(this.state.fecha)} />
                    </div>
                    <div className="tiporancho">
                        <select>
                            {this.state.tiporancho.map(elemento => (
                                <option key={elemento.idtiporancho} value={elemento.idtiporancho}>{elemento.nombre}</option>
                            ))}
                        </select>
                    </div>
                    <div className="menu">
                        <select>
                            {this.state.menu.map(elementomenu => (
                                <option key={elementomenu.idmenu} value={elementomenu.idmenu}>{elementomenu.descripcion}</option>
                            ))}
                        </select>
                    </div>
                </div></>
        );
    }
}

export default nuevo