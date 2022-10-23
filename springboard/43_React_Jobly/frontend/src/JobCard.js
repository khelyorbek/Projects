import React, { useState } from 'react';


// Bootstrap
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';

// Custom css
import "./CompanyCard.css";

// individual card of the total list of companies
// this is for the card that has company name, description and image

// receiving the full data for each card as props
const JobCard = (props) => {
    const [applied, setApplied] = useState(false);

    const applyToJob = (e) => {
        setApplied(!applied);
    }


    // destructuring the data param passed to us and storing everything into variables
    const { id, title, salary, equity, companyHandle, companyName } = props.data;
    return (<>

            {/* Creating a bootstrap Card component */}
            <Card className='g-0 my-2 cardFull'>
                {/* Showing the title in the header of the card */}
                <Card.Header><Card.Title>{title}</Card.Title></Card.Header>

                {/* Showing all the other data in the body of the card */}
                <Card.Body>
                    {/* a button to apply for job with some basic styling */}
                    {/* Also checking if logoUrl field exist in the data, if not, showing an image that says No logo */}
                    <Button onClick={applyToJob} style={{float: 'right', padding:'1rem'}} className={applied ? "btn-success" : "btn-primary"}>
                        <img alt="apply" src={applied ? "apply-success-light.png" : "apply-light.png"} style={{height: "1.7rem"}}></img> <strong>{applied ? "Applied" : "Apply"}</strong>
                    </Button>
                    
                    <Card.Text> 
                        <p>Salary: {salary}</p>
                        <p>Equity: {equity ? equity : "None"}</p>
                    
                    </Card.Text>
                    {/* Button below can be used for other purposes in the future */}
                    {/* <Button variant="primary">Go somewhere</Button> */}
                </Card.Body>
                <Card.Footer>
                    {/* Showing the amount of employees in the footer  */}
                    <Card.Subtitle>Company: {companyName}</Card.Subtitle>
                </Card.Footer>
            </Card>
    </>)
    
}

export default JobCard;

