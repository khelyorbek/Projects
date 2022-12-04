// react components
import React, { useState } from 'react';

// bootstrap
import Col from 'react-bootstrap/Col';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Button from 'react-bootstrap/Button';

const Search = ( {doSearch} ) => {
    // using state to keep track of the keyword used in the search
    const [keyword, setKeyword] = useState("");
    
    // when search is pressed, execute the prop function passed by the parent and pass the search term into it
    function handleSubmit(e) { 
        // preventing default function of the form (reload)
        e.preventDefault();
        // console.log(keyword);
        
        // only executes if the search/filter input is not blank
        if(keyword !== "") {doSearch(keyword)}
     }

    // updating session when something is typed
    function handleChange(e) {
        // setting the session to the value of the input
        setKeyword(e.target.value);
      }

    return (
    <>
        {/* bootstrap form component. executes handleSubmit when the form is sent */}
        <Form onSubmit={handleSubmit}>
            <Row style={{paddingLeft: "0.3em", width: "101.5%"}}>
                <Col className="col-10 px-2">
                    {/* calls the handleChange function when anything is typed/changed in the input */}
                    <Form.Control onChange={handleChange} placeholder="Filter by name / title" />
                </Col>
                <Col className="col-2 px-2">
                    <Button type="submit" variant="outline-primary" style={{width: "100%"}}>Search</Button>{' '}
                </Col>
            </Row>
        </Form>
    </>)
    
}

export default Search;

