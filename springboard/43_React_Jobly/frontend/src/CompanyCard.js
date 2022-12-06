// react components
import React from 'react';
import { Link } from 'react-router-dom';

// Bootstrap
import Card from 'react-bootstrap/Card';

// Custom css
import "./CompanyCard.css";

// individual card of the total list of companies
// this is for the card that has company name, description and image

// receiving the full data for each card as props
const CompanyCard = (props) => {


    // destructuring the data param passed to us and storing everything into variables
    const { name, handle, description, numEmployees, logoUrl} = props.data;
    return (<>

        {/* Wrapping everything in a link component so clicking on the entire card takes us to the right place */}
        <Link to={`/companies/${handle}`} className='cardLink'>
            {/* Creating a bootstrap Card component */}
            <Card className='g-0 my-2 cardFull'>
                {/* Showing the title in the header of the card */}
                <Card.Header><Card.Title>{name}</Card.Title></Card.Header>

                {/* Showing all the other data in the body of the card */}
                <Card.Body>
                    {/* Displaying a logo of the company with some basic styling */}
                    {/* Also checking if logoUrl field exist in the data, if not, showing an image that says No logo */}
                    <Card.Img style={{float: 'right', height:'4rem', width: '12em', padding:'1rem'}} src={logoUrl ? logoUrl : '/logos/nologo.png'} />
                    {/* showing description */}
                    <Card.Text> {description} </Card.Text>
                </Card.Body>
                <Card.Footer>
                    {/* Showing the amount of employees in the footer  */}
                    <Card.Subtitle>Employees: {numEmployees}</Card.Subtitle>
                </Card.Footer>
            </Card>
        </Link>
    </>)
    
}

export default CompanyCard;

