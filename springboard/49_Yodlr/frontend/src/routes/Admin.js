import './Admin.css';
import AdminRow from './AdminRow';
import { Button, Spinner, Table } from 'react-bootstrap';
import { useState, useEffect } from 'react';
import axios from 'axios';
const BASE_URL = "http://localhost:3001"

function Admin() {
  const [users, setUsers] = useState([]);
  const [isEmpty, setIsEmpty] = useState([false]);

  async function getUsers() {
    const res = await axios.get(`${BASE_URL}/users`);
    console.log("getUsers response >>>", res.data);

    return res.data;
  }

  useEffect(() => {
    getUsers().then((data) => { setUsers(data) });
  }, [])




  return (
    <>
      <div className="Admin">

        <div className="Admin-header">
          <h1><strong>User Administration Panel</strong></h1>
          <p>Please use the table below to review user details and toggle statuses.</p>

          {
            users.length === 0
              ? <p>Uh oh... The list of users is empty</p>
              : <div id="Admin-table">
                <Table striped hover variant="light" responsive>
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Email</th>
                      <th>Status</th>
                      <th>Toggle Status</th>
                      <th>Delete User</th>
                    </tr>
                  </thead>
                  <tbody>
                    {
                      users.map(sentUser => (
                        <AdminRow sentUser={sentUser} key={sentUser.id}></AdminRow>
                      ))
                    }

                  </tbody>
                </Table>
              </div>
          }
        </div>
      </div>
    </>
  );
}

export default Admin;
