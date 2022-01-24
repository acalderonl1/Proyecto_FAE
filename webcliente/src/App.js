import './App.css';

import "bootstrap/dist/css/bootstrap.min.css";
import React, { Component } from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Card from 'react-bootstrap/Card'
import axios from 'axios';
import ListGroup from 'react-bootstrap/ListGroup'
import ListGroupItem from 'react-bootstrap/ListGroupItem'
import { View, Text } from 'react-native';
import { Button } from 'react-bootstrap';
const url = "http://localhost:3000/usuario/datareservaweb";

class App extends Component {

  state = {
    data: []
  }

  peticionGet = () => {
    axios.get(url).then(response => {
      this.setState({ data: response.data });
      console.log(response.data);
    })
  }
  componentDidMount() {
    this.peticionGet()
  }


  render() {
    return (
      <div className="App">

        <br/> <br/> <br/> <br/> <br/>
        <input type="text" name="name" />
         <br/> <br/>
        <Row xs={1} md={4} className="g-4">
          {this.state.data.map(reserva => {
            return (
              <Col>
                <Card>
                  <Card.Body>
                    <Card.Title>{reserva.idreserva}</Card.Title>
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
                        new Intl.NumberFormat("en-EN").format(menudia_.precio*reserva.cantidad)
                      )
                    })} </ListGroupItem>
                  </ListGroup>
                  <Card.Footer>
                    <small className="text-muted">Estado de reserva: {reserva.estado}</small>
                  </Card.Footer>
                  <Col >
                    <Card.Body>
                      <Button style={{ backgroundColor: '#1E8449' }} >Pagar</Button>&nbsp;&nbsp;&nbsp;&nbsp;
                      <Button style={{ backgroundColor: '#B03A2E' }}  >Fiar</Button>&nbsp;
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
