import React from "react";
import { Switch, Route, Redirect } from "react-router-dom";

// Custom components and methods
import Home from "./Home";
import UserLogin from "./UserLogin";
import UserProfile from "./UserProfile";
import UserRegister from "./UserRegister";
import CompanyList from "./CompanyList";
import CompanyDetail from "./CompanyDetail";
import JobList from "./JobList";
// Bootstrap
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

const Routes = () => {
    return (
        <>
        <Container>
            <Col>
                <Row>
                    <Switch>
                        <Route exact path="/">
                            < Home />
                        </Route>
                        
                        <Route exact path="/login">
                            < UserLogin />
                        </Route>

                        <Route exact path="/signup">
                            < UserRegister />
                        </Route>

                        <Route exact path="/profile">
                            < UserProfile />
                        </Route>

                        <Route exact path="/companies">
                            < CompanyList />
                        </Route>

                        <Route exact path="/companies/:handle">
                            < CompanyDetail />
                        </Route>

                        <Route exact path="/jobs">
                            < JobList />
                        </Route>

                        <Redirect to="/" />

                    </Switch>
                </Row>
            </Col>
        </Container>
        </>
    )
}

export default Routes;