import { Button, Spinner, Table } from 'react-bootstrap';
import { useState, useEffect } from 'react';
import axios from 'axios';
const BASE_URL = "http://localhost:3001"

function AdminRow({ sentUser }) {
    // initializing state
    const [user, setUser] = useState();
    const [visible, setVisible] = useState(true);
    const [confirmed, setConfirmed] = useState(false);

    // setting the user passed to this component into state on load
    useEffect(() => {
        // console.log(sentUser)
        setUser(sentUser)
    }, [sentUser])

    async function updateStatus() {
        // if the user is disabled or pending approval
        if (user.state === "disabled" || user.state === "pending") {
            // then activate the user
            user.state = "active";
            // if the user is currently active
        } else {
            // then deactviate the user
            user.state = "disabled";
        }

        // sending a put request based on REST API
        const res = await axios.put(`${BASE_URL}/users/${user.id}`, user);
        // setting the new user into the state
        setUser(res.data);
        // console.log("updateStatus response >>>", res.data);
        return res.data;
    }

    async function deleteUser() {
        // on first delete press
        if (confirmed === false) {
            setConfirmed(true)
        } else {
            // sending a delete request based on REST API
            const res = await axios.delete(`${BASE_URL}/users/${user.id}`);
            // console.log("deleteUser response >>>", res.data);

            // hiding the component
            setVisible(false);
            return res.data;
        }

    }


    if (!user) return <tr><td colSpan={7}>Loading...</td></tr>

    return <>
        {
            visible
                ? <tr key={user.id}>
                    <td>{user.id}</td>
                    <td>{user.firstName}</td>
                    <td>{user.lastName}</td>
                    <td>{user.email}</td>
                    <td className={
                        user.state === "active" 
                        ? "fw-bold text-success" 
                        : user.state === "pending" 
                            ? "fw-bold text-warning" 
                            : "fw-bold text-danger"
                        }>
                            {user.state}
                    </td>
                    <td>
                        <Button variant={
                            user.state === "active" 
                            ? "secondary" 
                            : "success"} 
                            onClick={updateStatus}>
                                {user.state === "active" 
                                ? "❌ Disable" 
                                : "✅ Enable"}
                        </Button>
                    </td>

                    <td>
                        <Button variant={
                            confirmed 
                            ? "danger" 
                            : 'outline-danger'} 
                            onClick={deleteUser}>
                                {confirmed 
                                ? "Confirm?" 
                                : "Delete"}
                        </Button>
                    </td>
                </tr>
                : null
        }

    </>

}

export default AdminRow;