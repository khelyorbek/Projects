import React, { useState } from 'react';
import Col from 'react-bootstrap/Col';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Button from 'react-bootstrap/Button';

const Search = ( {doSearch} ) => {
    const [keyword, setKeyword] = useState("");
    
    // when search is pressed, execute the prop function passed by the parent and pass the search term into it\companies\anderson-arias-morrow
    function handleSubmit(e) { 
        e.preventDefault();
        // console.log(keyword);
        if(keyword !== "") {doSearch(keyword)}
     }

    // updating session when something is typed
    function handleChange(e) {
        setKeyword(e.target.value);
      }

    return (
    <>
        <Form onSubmit={handleSubmit}>
            <Row style={{paddingLeft: "0.3em", width: "101.5%"}}>
                <Col className="col-10 px-2">
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

