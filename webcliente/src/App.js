import "bootstrap/dist/css/bootstrap.min.css";
import React, { Component } from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Card from 'react-bootstrap/Card'
import axios from 'axios';
import swal from 'sweetalert';
import ListGroup from 'react-bootstrap/ListGroup'
import ListGroupItem from 'react-bootstrap/ListGroupItem'
import { Button } from 'react-bootstrap';
const url = "http://localhost:3000/usuario/datareservaweb";
const urlPutreserva = "http://localhost:3000/reserva/update/";
class App extends Component {
  state = {
    data: [],
    form: {
      estado: 'C',
    },
    form2: {
      estado: 'P',
    }
  }
  modalInsertar = () => {
    this.setState({ modalInsertar: !this.state.modalInsertar });
  }
  peticionGet = () => {
    axios.get(url).then(response => {
      this.setState({ data: response.data });
      console.log(response.data);
    })
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
  handleChange = async e => {
    e.persist();
    await this.setState({
      form: {
        ...this.state.form,
        [e.target.name]: e.target.value
      }
    });
    console.log(this.state.form);
  }

  componentDidMount() {
    this.peticionGet()
  }


  render() {
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
    const variable=0;
    const { form } = this.state;
    return (
      <div className="App">
        <br /> <br /> <br /> <br /> <br />

        <br /> <br />
        <Row xs={1} md={4} className="g-4">
          {this.state.data.map(reserva => {
            return (
              <Col>
                <Card>
                  <Card.Body>
                    <Card.Title value={form.idreserva}>{reserva.idreserva}</Card.Title>
                    <Card.Text>
                      {reserva.personas.map(menudia => {
                        return (
                          menudia.nombres
                        )
                      })}
                    </Card.Text>
                  </Card.Body>
                  <ListGroup className="list-group-flush">
                    <ListGroupItem>Día: {reserva.menudia.map(menudia => {
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
                  <Card.Footer>
                    <small className="text-muted">Estado de reserva: {reserva.estado}</small>
                  </Card.Footer>
                  <Col >
                    <Card.Body>
                      <Button style={{ backgroundColor: '#1E8449' }} onClick={() => alertaConfirmacion(reserva.idreserva)}>Pagar</Button>&nbsp;&nbsp;&nbsp;&nbsp;

                      <Button style={{ backgroundColor: '#B03A2E' }} onClick={() => alertaFiar(reserva.idreserva)}  >Fiar</Button>&nbsp;
                    </Card.Body>
                  </Col>
                </Card>

              </Col>

            )

          })}  <br /><br /><br /> </Row> <br /><br /><br />
      </div>
    );
  }
}

export default App;
