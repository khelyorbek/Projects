import './Register.css';
import { Form, InputGroup, Button, Spinner } from 'react-bootstrap';
import { useState } from "react"
import axios from 'axios';
import { useNavigate } from "react-router-dom";
const BASE_URL = "http://localhost:3001"

function Register() {
  const [isLoading, setIsLoading] = useState(false);
  const [formData, setFormData] = useState({});
  const navigate = useNavigate();

  const handeChange = (e) => {
    // console.log(e.target.value);
    // console.log(e.target.name);

    const k = e.target.name;
    const v = e.target.value;

    setFormData({
      ...formData,
      [k]: v
    })

    // console.log("formData >>>", formData);
  }

  async function registerUser() {
    // adding the suffix of the yodlr website
    formData['email'] = formData['email'] + '@getyodlr.com';
    // sending a post request per REST API
    const res = await axios.post(`${BASE_URL}/users`, formData);
    // console.log("registerUser response >>> ", res.data);
    return res.data;
  }

  const handleSubmit = (e) => {
    // preventing normal form behavior
    e.preventDefault();
    // setting the loading screen to true
    setIsLoading(true);
    // sending an API request
    registerUser().then(() => {
      // turning off the loading screen right after the API call is finished
      setIsLoading(false);
      // redirecting to the Admin panel
      navigate("/admin")
    });
  }

  return (
    <>
      <div className="Register">
        <div className="Register-header">
          <h1><strong>Registration</strong></h1>
          <p>Please provide the details and click register</p>

          <div id="content">
            <Form onSubmit={handleSubmit}>
              <InputGroup className="mb-3">
                <InputGroup.Text id="basic-addon1">First name</InputGroup.Text>
                <Form.Control
                  placeholder="Please provide your first name here"
                  aria-label="First Name"
                  disabled={isLoading}
                  onChange={handeChange}
                  name="firstName"
                />
              </InputGroup>

              <InputGroup className="mb-3">
                <InputGroup.Text id="basic-addon1">Last name</InputGroup.Text>
                <Form.Control
                  placeholder="Please provide your last name here"
                  aria-label="Last Name"
                  disabled={isLoading}
                  onChange={handeChange}
                  name="lastName"
                />
              </InputGroup>

              <InputGroup className="mb-3">
                <Form.Control
                  placeholder="Please pick an email for yourself"
                  aria-label="Email"
                  disabled={isLoading}
                  onChange={handeChange}
                  name="email"
                />
                <InputGroup.Text id="basic-addon2">@getyodlr</InputGroup.Text>
              </InputGroup>

              <div className="d-grid">
                <Button type="submit" variant="dark" style={{ border: "1px solid white" }} disabled={isLoading}>
                  {isLoading ? <><Spinner animation="border" size="sm" /> Loading... </> : "Register"}

                </Button>
              </div>
            </Form>
          </div>
        </div>
      </div>


    </>
  );
}

export default Register;
