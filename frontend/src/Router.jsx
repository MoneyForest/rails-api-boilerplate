import React from 'react';
import { Route, Switch } from "react-router";
import { Home } from "./templates";

const Router = () => {
    return(
        <Switch>
            <Route exact path='/' component={Home} />
            <Route exact path='/hoge  ' component={Home} />
        </Switch>
    );
};

export default Router;
