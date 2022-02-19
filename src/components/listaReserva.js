import React, { useEffect, useState } from 'react'
import axios from "axios";
import '../assets/css/App.css';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import "bootstrap/dist/css/bootstrap.min.css";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSearch } from '@fortawesome/free-solid-svg-icons';
import Pagination from './Pagination';
import Card from 'react-bootstrap/Card'
import ReactExport from "react-export-excel";
import ListGroup from 'react-bootstrap/ListGroup'
import ListGroupItem from 'react-bootstrap/ListGroupItem'
import { Button } from 'react-bootstrap';
import swal from 'sweetalert';
import '../assets/css/btn_number.css';

const ExcelFile = ReactExport.ExcelFile;
const ExcelSheet = ReactExport.ExcelFile.ExcelSheet;
const ExcelColumn = ReactExport.ExcelFile.ExcelColumn;
const urlPutreserva = "http://localhost:3000/reserva/update/";


function listareserva() {
    const state = {
        form: {
            estado: 'C',
        },
        form2: {
            estado: 'P',
        },
    };
    const [usuarios, setUsuarios] = useState([]);
    const [tablaUsuarios, setTablaUsuarios] = useState([]);
    const [busqueda, setBusqueda] = useState("");
    const [currentPage, setCurrentPage] = useState(1);
    const [postsPerPage] = useState(6);

    const peticionGet = async () => {
        await axios.get("http://localhost:3000/usuario/datareservaweb")
            .then(response => {
                setUsuarios(response.data);
                setTablaUsuarios(response.data);

            }).catch(error => {
                console.log(error);
            })
    }

    const peticionPut = async (idreserva) => {
        console.log(idreserva);
        console.log(state.form);
        await axios.put(urlPutreserva + idreserva, state.form).then(response => {
            peticionGet();
        })
    }
    const peticionPutFiar = async (idreserva) => {
        console.log(idreserva);
        console.log(state.form);
        await axios.put(urlPutreserva + idreserva, state.form2).then(response => {
            peticionGet();
        })
    }
    const handleChange = e => {
        setBusqueda(e.target.value);
        filtrar(e.target.value);
    }
    const filtrar = (terminoBusqueda) => {
        var resultadosBusqueda = tablaUsuarios.filter((elemento) => {

            if (elemento.idreserva.toString().includes(terminoBusqueda.toLowerCase()) ||
                elemento.estado.toString().toLowerCase().includes(terminoBusqueda.toLowerCase()) ||
                elemento.personas.map((per) => {
                    return (per.nombres)
                }).toString().toLowerCase().includes(terminoBusqueda.toLowerCase())
                ||
                elemento.personas.map((per) => { return (per.dni) }).toString().toLowerCase().includes(terminoBusqueda.toLowerCase())
                ||

                elemento.menudia.map((menudia1) => { return (menudia1.dia) }).toString().toLowerCase().includes(terminoBusqueda.toLowerCase())
                ||

                elemento.menudia.map((menudiafecha) => { return (menudiafecha.dia_fecha) }).toString().toLowerCase().includes(terminoBusqueda.toLowerCase())

            ) {
                return elemento;
            }
        });
        setUsuarios(resultadosBusqueda);
    }

    useEffect(() => {
        peticionGet();
    }, [])

    const alertaConfirmacion = (reserva) => {
        swal({
            title: "Confirmar pago",
            text: "Estás seguro que deseas confirmar pago?",
            icon: "warning",
            buttons: ["No", "Si"]
        }).then(repuesta => {
            if (repuesta) {
                swal({
                    text: "La reserva se a cancelado con exito",
                    icon: "success"
                });
                peticionPut(reserva)
                console.log(reserva);
            }
        })
    }
    const alertaFiar = (reserva) => {
        swal({
            title: "Fiar reserva",
            text: "Estás seguro que deseas fiar?",
            icon: "warning",
            buttons: ["No", "Si"]
        }).then(repuesta => {
            if (repuesta) {
                swal({
                    text: "La reserva se a fiado con exito",
                    icon: "success"
                });
                peticionPutFiar(reserva)
                console.log(reserva);
            }
        })
    }



    const indexOfLastPost = currentPage * postsPerPage;
    const indexOfFirstPost = indexOfLastPost - postsPerPage;


    // Change page
    const paginate = pageNumber => setCurrentPage(pageNumber);

    return (

        <div className="App">
            <br />

            {/* <div align="right">

                <ExcelFile element={<div className="mb-2">
                    <Button variant="primary" size="lg" >
                        Descargar Excel
                    </Button>{' '}

                </div>} filename="Excel reservas">
                    <ExcelSheet data={usuarios} name="Reservas comedor">
                        <ExcelColumn label="idreserva" value="idreserva" />
                        <ExcelColumn label="Estado" value="estado" />
                        <ExcelColumn label="Nombre persona" value={(person) => person.personas.map((per) => per.nombres).toString().toLowerCase()} />
                        <ExcelColumn label="Correo" value={(person) => person.personas.map((per) => per.correo).toString().toLowerCase()} />
                        <ExcelColumn label="Telefono" value={(person) => person.personas.map((per) => per.telefono).toString().toLowerCase()} />
                        <ExcelColumn label="dni" value={(person) => person.personas.map((per) => per.dni).toString().toLowerCase()} />
                        <ExcelColumn label="dia" value={(menud) => menud.menudia.map((menudiadia) => menudiadia.dia).toString().toLowerCase()} />
                        <ExcelColumn label="fecha" value={(elemento) => elemento.menudia.map((menudiafecha) => menudiafecha.dia_fecha).toString().toLowerCase()} />
                        <ExcelColumn label="precio" value={(menud) => menud.menudia.map((menudiaprecio) => menudiaprecio.precio).toString().toLowerCase()} />
                        <ExcelColumn label="cantidad" value="cantidad" />
                    </ExcelSheet>

                </ExcelFile>
            </div> */}
            <p style={{ fontSize: "25px" }} >Total reserva</p>
            <div align="center">  <p className='totalreserva' style={{ fontSize: "50px", backgroundColor: '#5DADE2' }} >  {usuarios.length}  </p>
            </div>


            <br />
            <div className="containerInput" >
                <input
                    className="form-control inputBuscar"
                    value={busqueda}
                    placeholder="Búsqueda por idreserva / Nombre / dni / fecha"
                    onChange={handleChange}
                />
                <button className="btn btn-success">
                    <FontAwesomeIcon icon={faSearch} />
                </button>
            </div>

            <div className="table-responsive">
                <Row xs={1} md={4} className="g-4">
                    {usuarios &&
                        usuarios.slice(indexOfFirstPost, indexOfLastPost).map(reserva => {
                            return (
                                <Col md={4} className="mb-2" key={reserva.idreserva}>
                                    <Card className="carta" style={{ backgroundColor: reserva.estado === 'A' ? '#5DADE2' : '#9C2A1F' }}>
                                        <Card.Body key={reserva.idreserva}>
                                            <Card.Title className="row justify-content-center" value="reservaid">{reserva.idreserva}</Card.Title>
                                            <Card.Text style={{ fontSize: "22px", textAlign: "center", color: "black" }}>
                                                {reserva.personas.map(menudia => {
                                                    return (
                                                        menudia.nombres
                                                    )
                                                })}
                                            </Card.Text>
                                        </Card.Body>
                                        <ListGroup className="list-group-flush" key="lista">
                                            <ListGroupItem key="lista">Día: {reserva.menudia.map(menudia => {
                                                return (
                                                    menudia.dia
                                                )
                                            })} / {reserva.menudia.map(menudia => {
                                                return (
                                                    menudia.dia_fecha
                                                )
                                            })}</ListGroupItem>
                                            <ListGroupItem>{reserva.menudia.map(menudia => {
                                                return (
                                                    menudia.tiporanchos.map(tiporancho => {
                                                        return (
                                                            tiporancho.nombre
                                                        )
                                                    })
                                                )
                                            })}</ListGroupItem>
                                            <ListGroupItem>{reserva.menudia.map(menudia => {
                                                return (
                                                    menudia.menus.map(menu => {
                                                        return (
                                                            menu.descripcion
                                                        )
                                                    })
                                                )
                                            })}</ListGroupItem>
                                            <ListGroupItem>{reserva.menudia.map(menudia => {
                                                return (
                                                    menudia.comedors.map(comedor => {
                                                        return (
                                                            comedor.nombre
                                                        )
                                                    })
                                                )
                                            })}</ListGroupItem>
                                        </ListGroup>

                                        <ListGroup className="list-group-flush">
                                            <ListGroupItem>Correo: {reserva.personas.map(persona => {
                                                return (
                                                    persona.correo
                                                )
                                            })} </ListGroupItem>
                                            <ListGroupItem>Telefono: {reserva.personas.map(persona => {
                                                return (
                                                    persona.telefono
                                                )
                                            })}</ListGroupItem>
                                            <ListGroupItem>DNI: {reserva.personas.map(persona => {
                                                return (
                                                    persona.dni
                                                )
                                            })}</ListGroupItem>
                                            <ListGroupItem>Precio: {reserva.menudia.map(menudia_ => {
                                                return (
                                                    new Intl.NumberFormat("en-EN").format(menudia_.precio)
                                                )
                                            })} Cantidad: {new Intl.NumberFormat("en-EN").format(reserva.cantidad)}
                                            </ListGroupItem>
                                            <ListGroupItem>Total a pagar: {reserva.menudia.map(menudia_ => {
                                                return (
                                                    new Intl.NumberFormat("en-EN").format(menudia_.precio * reserva.cantidad)
                                                )
                                            })} </ListGroupItem>
                                        </ListGroup>

                                        <Card.Footer className="row justify-content-center" value="reservaid">

                                            <ListGroupItem>
                                                <p style={{ fontSize: "22px", textAlign: "center", color: "black" }}>{reserva.estado === 'A' ? 'Activa' : 'Pendiente de pago'}</p>
                                            </ListGroupItem>

                                        </Card.Footer>


                                        {reserva.estado === 'A' ?
                                            <Col className="button" >
                                                <Card.Body  >
                                                    <Button style={{ backgroundColor: '#1E8449' }} onClick={() => alertaConfirmacion(reserva.idreserva)} variant="primary" type="submit">Pagar</Button>&nbsp;&nbsp;&nbsp;&nbsp;

                                                    <Button style={{ backgroundColor: '#B03A2E' }} onClick={() => alertaFiar(reserva.idreserva)}  >Fiar</Button>&nbsp;
                                                </Card.Body>
                                            </Col>
                                            : <>     <Button style={{ backgroundColor: '#1E8449' }} onClick={() => alertaConfirmacion(reserva.idreserva)} variant="primary" type="submit">Pagar</Button>&nbsp;&nbsp;&nbsp;&nbsp;
                                            </>
                                        }
                                    </Card>
                                </Col>

                            )

                        })}   <br /><br /><br /> </Row> <br /><br /><br />

                <Pagination
                    postsPerPage={postsPerPage}
                    totalPosts={usuarios.length}
                    paginate={paginate}
                />
            </div>
        </div>
    );
}

export default listareserva;