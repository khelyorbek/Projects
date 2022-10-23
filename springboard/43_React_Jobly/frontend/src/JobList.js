import React, { useState, useEffect } from 'react';

// Custom components and functions
import JoblyApi from './api';
import LoadingBar from './LoadingBar';
import JobCard from './JobCard';
import Search from './Search';

// Bootcamp
import Container from 'react-bootstrap/Container';

const JobList = () => {
    const [jobs, setJobs] = useState();

    // grabbing a list of jobs
    useEffect(() => {
        // not passing anything since we just want to get the jobs
        getJob();
    }, [])

    // function for getting the company. must be async since API is async
    async function getJob(titleFilter) {
        let res = await JoblyApi.getJobs(titleFilter)
        // console.log(res)
        setJobs(res);
    }

    if(!jobs) { return  < LoadingBar /> }

    return (<>
        <h1 className='display-6 text-center'>List of Jobs</h1>
            <Search doSearch={getJob} />
        {
           // since we use this area for filtering also, if there are no results
           jobs.length === 0 
           // then show a container saying there are no results
           ? <Container className="text-center p-5"> <h3 className="text-info">No results found. Please try again.</h3> </Container>
           // otherwise
           // looping through the entire list of companies.
            // creating a new companyCard component and passing all the data for each company.
           : jobs.map(comp => (<JobCard key={comp.id} data={comp}/>)) 
        }
    </>)
}

export default JobList;

