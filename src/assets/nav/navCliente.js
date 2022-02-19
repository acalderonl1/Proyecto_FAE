import React, { Component } from 'react'
import { Navbar, NavDropdown, Form, FormControl, Button, Nav } from 'react-bootstrap'


export default class NavbarComp extends Component {
    render() {

        return (

            <div>
                <Navbar bg="dark" variant={"dark"} expand="lg">
                    <Navbar.Brand href="#">Cliente</Navbar.Brand>
                    <Navbar.Toggle aria-controls="navbarScroll" />
                    <Navbar.Collapse id="navbarScroll">
                        <Nav
                            className="mr-auto my-2 my-lg-0"
                            style={{ maxHeight: '100px' }}
                            navbarScroll
                        >
                            <Nav.Link href="/dashboardClient">Pricipal</Nav.Link>
                            <Nav.Link href="/reservas">Reservas</Nav.Link>
                            <Nav.Link href="/crearMenu">Crear menú</Nav.Link>
                            <Nav.Link href="/ListaMenu">Calendario de Menus</Nav.Link>
                            <Button className="btn btn-secondary" href="/" >Salir</Button>
                        </Nav>
                    </Navbar.Collapse>
                </Navbar>
            </div>
        )
    }
}
