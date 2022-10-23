import React, { useState, useEffect } from 'react';

// Custom components and functions
import JoblyApi from './api';
import LoadingBar from './LoadingBar';
import CompanyCard from './CompanyCard';
import Search from './Search';

// Bootcamp
import Container from 'react-bootstrap/Container';

// this should show the full list of companies available
// should use companyCard for each individual company
const CompanyList = () => {
    const [companies, setCompanies] = useState();

    // grabbing a list of companies
    useEffect(() => {
        // not passing anything since we just want to get the company
        getComp();
    }, [])

    // function for getting the company. must be async since API is async
    async function getComp(nameFilter) {
        let res = await JoblyApi.getCompanies(nameFilter)
        // console.log(res)
        setCompanies(res);

    }

    if(!companies) { return  < LoadingBar /> }

    return (<>
        <h1 className='display-6 text-center'>List of Companies</h1>
            <Search doSearch={getComp} />
        {
           // since we use this area for filtering also, if there are no results
           companies.length === 0 
           // then show a container saying there are no results
           ? <Container className="text-center p-5"> <h3 className="text-info">No results found. Please try again.</h3> </Container>
           // otherwise
           // looping through the entire list of companies.
            // creating a new companyCard component and passing all the data for each company.
           : companies.map(comp => (<CompanyCard key={comp.handle} data={comp}/>)) 
        }
    </>)
    
}

export default CompanyList;

