import React from 'react';
import '../src/assets/css/App.css';
import 'bootstrap/dist/css/bootstrap.css';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import DashboardAdmin from './components/dashboardAdmin'
// import DashboardClient from './components/listaReserva'
import CrearMenu from './components/crearMenu'
import Editar from './components/editar'
import Login from './components/login'


function App() {
  return (
    <div className="App">
      <React.Fragment>
        <Router>
          <Switch>
            <Route path="/" exact render={props => (<Login {...props} />)}></Route>
            <Route path="/dashboardAdmin" exact render={props => (<DashboardAdmin {...props} />)}></Route>
            {/* <Route path="/dashboardClient" exact render={props => (<DashboardClient {...props} />)}></Route> */}
            <Route path="/crearMenu" exact render={props => (<CrearMenu {...props} />)}></Route>
            <Route path="/editar" exact render={props => (<Editar {...props} />)}></Route>

          </Switch>
        </Router>
      </React.Fragment>
    </div>
  );
}

export default App;


