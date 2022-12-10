// react component
import React, { useState, useContext, useEffect } from 'react';

// images were breaking if used from the public folder so I had to import them
// solution from: https://stackoverflow.com/questions/34582405/react-wont-load-local-images
import imgApply from "./apply-light.png"
import imgApplyDone from "./apply-success-light.png"
import JoblyApi from './api';
import GlobalContext from './GlobalContext';

// Bootstrap
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';
import Placeholder from 'react-bootstrap/Placeholder';

// Custom css
import "./CompanyCard.css";

// individual card of the total list of companies
// this is for the card that has company name, description and image

// receiving the full data for each card as props
const JobCard = (props) => {
    // destructuring the data param passed to us and storing everything into variables
    const { id, title, salary, equity, companyName } = props.data;

    // adding state and toggle for data loaded or not
    const [applied, setApplied] = useState(false);
    const [dataLoaded, setDataLoaded] = useState(false)

    // context for curr user
    const { currentUser } = useContext(GlobalContext);
    
    // custom function to apply to a Job
    async function applyToJob() {
        // setting state of applied to true
        setApplied(true);
        // sending API call to add applied job into the database
        await JoblyApi.applyToJob(currentUser.username, id);
        // adding the current job into the currentUser context into application array
        currentUser.applications.push(id);
    }

    // when id or applications array changes, also runs when the card first renders
    useEffect(() => {
        // check if the current job id is listed in the applications array
        if (currentUser.applications.includes(id)) {
            // if so, set the applied of this card's state true
            setApplied(true);
        }
        // set the data loading toggle to true so the data can display
        setDataLoaded(true);
    }, [id, currentUser.applications])

    // showing this if the data is loaded
    if (dataLoaded) {
        return (<>

            {/* Creating a bootstrap Card component */}
            <Card className='g-0 my-2 cardFull'>
                {/* Showing the title in the header of the card */}
                <Card.Header><Card.Title>{title}</Card.Title></Card.Header>

                {/* Showing all the other data in the body of the card */}
                <Card.Body>
                    {/* a button to apply for job with some basic styling */}
                    {/* if the job has been applied, setting the icon, text to applied and disabling the button */}
                    {/* if the job hasn't been applied, enable the button and set the text and icon to apply */}
                    <Button
                        disabled={applied ? true : ''}
                        onClick={applyToJob}
                        style={{ float: 'right', padding: '1rem' }}
                        className={applied ? "btn-success" : "btn-primary"}
                    >
                        <img alt="apply" src={applied ? imgApplyDone : imgApply} style={{ height: "1.7rem" }}></img> <strong>{applied ? "Applied" : "Apply"}</strong>
                    </Button>

                    {/* showing the salary and the equity for each job */}
                    <Card.Text>
                        <span>Salary: {salary ? salary : "Unknown"}</span>
                        <br></br>
                        <span>Equity: {equity ? equity : "None"}</span>

                    </Card.Text>
                    
                </Card.Body>
                <Card.Footer>
                    {/* Showing the amount of employees in the footer  */}
                    <Card.Subtitle>Company: {companyName}</Card.Subtitle>
                </Card.Footer>
            </Card>
        </>)
    } 
    // if the data hasn't loaded yet, show this
    else {
        return (<>

            {/* Creating a bootstrap Card component */}
            <Card className='g-0 my-2 cardFull'>
                {/* showing a placeholder that acts like a title */}
                <Card.Header>
                    <Placeholder as={Card.Title} animation="glow">
                        <Placeholder xs={6} />
                    </Placeholder>
                </Card.Header>

                {/* Showing all the other data in the body of the card */}
                <Card.Body>
                    {/* showing a placeholder that acts like a button */}
                    <Placeholder.Button className="btn-primary" aria-hidden="true" style={{ float: 'right', padding: '1rem', color: 'transparent'}}> Applied___</Placeholder.Button>

                    {/* showing a placeholder that acts like Card text */}
                    <Placeholder as={Card.Text} animation="glow">
                        <Placeholder xs={3} />
                    </Placeholder>

                    {/* showing a placeholder that acts like Card text */}
                    <Placeholder as={Card.Text} animation="glow">
                        <Placeholder xs={2} />
                    </Placeholder>
                </Card.Body>
                <Card.Footer>
                    {/* showing placeholder that acts like a Card subtitle in the footer */}
                    <Placeholder as={Card.Subtitle} animation="glow">
                        <Placeholder xs={4} />
                    </Placeholder>
                </Card.Footer>
            </Card>
        </>)
    }

}

export default JobCard;

