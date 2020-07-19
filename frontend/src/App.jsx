import React, { useState, useCallback } from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect
} from 'react-router-dom'

import './assets/styles/style.css';
import { Home } from './pages/index';

const App = () => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const signIn = useCallback(() => {
    setIsAuthenticated(true);
  }, [setIsAuthenticated]);

  return (
    <div>
      <h2>{isAuthenticated.toString()}</h2>
      <Router>
        <Switch>
          <Route exact path="/" render={ () => isAuthenticated
            ? (<Redirect to="/"/>)
            : (<Home signIn={signIn} />)
          }/>
        </Switch>
      </Router>
    </div>
  );
};

export default App;
