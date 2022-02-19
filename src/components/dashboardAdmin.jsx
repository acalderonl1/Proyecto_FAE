import "bootstrap/dist/css/bootstrap.min.css";
import React, { Component, useState, useEffect } from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Pagination from './Pagination';
import Card from 'react-bootstrap/Card'
import axios from 'axios';
import swal from 'sweetalert';
import ListGroup from 'react-bootstrap/ListGroup'
import ListGroupItem from 'react-bootstrap/ListGroupItem'
import { Button } from 'react-bootstrap';
import Navbar from '../assets/nav/navAdmin'
const url = "http://localhost:3000/usuario/datareservaweb";
const urlPutreserva = "http://localhost:3000/reserva/update/";

class dashboardAdmin extends Component {
    state = {
        posts: [],
        currentPage: 1,
        postsPerPage: 6,
        form: {
            estado: 'C',
        },
        form2: {
            estado: 'P',
        },
    };
    modalInsertar = () => {
        this.setState({ modalInsertar: !this.state.modalInsertar });
    }
    peticionGet = () => {
        axios.get(url).then(response => {
            this.setState({ posts: response.data });
            console.log(response.data);
        });

    }

    peticionPut = (idreserva) => {
        console.log(idreserva);
        console.log(this.state.form);
        axios.put(urlPutreserva + idreserva, this.state.form).then(response => {
            this.peticionGet();
        })
    }
    peticionPutFiar = (idreserva) => {
        console.log(idreserva);
        console.log(this.state.form);
        axios.put(urlPutreserva + idreserva, this.state.form2).then(response => {
            this.peticionGet();
        })
    }
    /*   handleChange = async e => {
           e.persist();
           await this.setState({
               form: {
                   ...this.state.form,
                   [e.target.name]: e.target.value
               }
           });
           console.log(this.state.form);
       }*/

    componentDidMount() {
        this.peticionGet()
    }

    render() {

        const { currentPage, postsPerPage, posts } = this.state;

        const indexOfLastPost = currentPage * postsPerPage;
        const indexOfFirstPost = indexOfLastPost - postsPerPage;
        const currentPosts = posts.slice(indexOfFirstPost, indexOfLastPost);

        const paginate = pageNum => this.setState({ currentPage: pageNum });

        const nextPage = () => this.setState({ currentPage: currentPage + 1 });

        const prevPage = () => this.setState({ currentPage: currentPage - 1 });
        const { form } = this.state;
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
                    this.peticionPut(reserva)
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
                    this.peticionPutFiar(reserva)
                    console.log(reserva);
                }
            })
        }

        const color = '#5DADE2';
        return (
            <><Navbar />
                <div className="home">
                    <Pagination className="pagination" postsPerPage={postsPerPage} totalPosts={posts.length} paginate={paginate} nextPage={nextPage} prevPage={prevPage} />
                    <br /> <br /> <br /> <br /> <br />
                    <br /> <br />
                    <div>
                        <Row xs={1} md={4} className="g-4">
                            {currentPosts.map(reserva => {
                                return (
                                    <Col md={4} className="mb-2">
                                        <Card className="carta" style={{ backgroundColor: color }}>
                                            <Card.Body key={reserva.idreserva}>
                                                <Card.Title className="row justify-content-center" value={reserva.idreserva}>{reserva.idreserva}</Card.Title>
                                                <Card.Text className="row justify-content-center">
                                                    {reserva.personas.map(menudia => {
                                                        return (
                                                            menudia.nombres
                                                        );
                                                    })}
                                                </Card.Text>
                                            </Card.Body>
                                            <ListGroup className="list-group-flush">
                                                <ListGroupItem>Día: {reserva.menudia.map(menudia => {
                                                    return (
                                                        menudia.dia
                                                    );
                                                })} / {reserva.menudia.map(menudia => {
                                                    return (
                                                        menudia.dia_fecha
                                                    );
                                                })}</ListGroupItem>
                                                <ListGroupItem>{reserva.menudia.map(menudia => {
                                                    return (
                                                        menudia.tiporanchos.map(tiporancho => {
                                                            return (
                                                                tiporancho.nombre
                                                            );
                                                        })
                                                    );
                                                })}</ListGroupItem>
                                                <ListGroupItem>{reserva.menudia.map(menudia => {
                                                    return (
                                                        menudia.menus.map(menu => {
                                                            return (
                                                                menu.descripcion
                                                            );
                                                        })
                                                    );
                                                })}</ListGroupItem>
                                                <ListGroupItem>{reserva.menudia.map(menudia => {
                                                    return (
                                                        menudia.comedors.map(comedor => {
                                                            return (
                                                                comedor.nombre
                                                            );
                                                        })
                                                    );
                                                })}</ListGroupItem>
                                            </ListGroup>

                                            <ListGroup className="list-group-flush">
                                                <ListGroupItem>Correo: {reserva.personas.map(persona => {
                                                    return (
                                                        persona.correo
                                                    );
                                                })} </ListGroupItem>
                                                <ListGroupItem>Telefono: {reserva.personas.map(persona => {
                                                    return (
                                                        persona.telefono
                                                    );
                                                })}</ListGroupItem>
                                                <ListGroupItem>DNI: {reserva.personas.map(persona => {
                                                    return (
                                                        persona.dni
                                                    );
                                                })}</ListGroupItem>
                                                <ListGroupItem>Precio: {reserva.menudia.map(menudia_ => {
                                                    return (
                                                        new Intl.NumberFormat("en-EN").format(menudia_.precio)
                                                    );
                                                })} Cantidad: {new Intl.NumberFormat("en-EN").format(reserva.cantidad)}
                                                </ListGroupItem>
                                                <ListGroupItem>Total a pagar: {reserva.menudia.map(menudia_ => {
                                                    return (
                                                        new Intl.NumberFormat("en-EN").format(menudia_.precio * reserva.cantidad)
                                                    );
                                                })} </ListGroupItem>
                                            </ListGroup>

                                            <Card.Footer>
                                                <small className="text-muted">Estado de reserva: {reserva.estado}</small>
                                            </Card.Footer>

                                            <Col className="button">
                                                <Card.Body>
                                                    <Button style={{ backgroundColor: '#1E8449' }} onClick={() => alertaConfirmacion(reserva.idreserva)} variant="primary" type="submit">Pagar</Button>&nbsp;&nbsp;&nbsp;&nbsp;

                                                    <Button style={{ backgroundColor: '#B03A2E' }} onClick={() => alertaFiar(reserva.idreserva)}>Fiar</Button>&nbsp;
                                                </Card.Body>
                                            </Col>
                                        </Card>

                                    </Col>

                                );

                            })}   <br /><br /><br /> </Row> <br /><br /><br />


                    </div>

                </div></>

        );
    }
}

export default dashboardAdmin;