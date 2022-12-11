// react components
import React, { useState, useEffect } from 'react';

// Custom components and functions
import JoblyApi from './api';
import LoadingBar from './LoadingBar';
import JobCard from './JobCard';
import Search from './Search';

// Bootcamp
import Container from 'react-bootstrap/Container';

const JobList = (props) => {
    // using state to store the jobs
    const [jobs, setJobs] = useState();

    // recieving an optional jobList, this is for when this component is used from within CompanyDetail component
    // by itself if the JobList is not provided, it will reach out to API and grab a full list of jobs
    // if its provided, then it will use the list provided
    const optionalJobList = props.jobs;

    // grabbing a list of jobs
    useEffect(() => {
        // not passing anything since we just want to get the jobs
        getJob();
    }, [])

    // function for getting the company. must be async since API is async
    async function getJob(titleFilter) {
        // settings the res to an empty array
        let res = [];
        // if we are passing the job list already (by opening the company details page)
        if (optionalJobList) { 
            // then setting the res to the passed prop
            res = optionalJobList;
         }
        else {
            // otherwise doing API call to get all the jobs
            res = await JoblyApi.getJobs(titleFilter)
        }
        // setting the res into the state in the end
        setJobs(res);
        
        
    }

    // show a loading bar if the jobs haven't loaded yet
    if(!jobs) { return  < LoadingBar /> }

    return (<>
        {/* showing just text if not on company details page
        if we are on the company details page, then showing text plus the name of the company plus Search bar */}
        <h1 className='display-6 text-center'>List of Jobs {props.compName ? ` for ${props.compName}` : ''} </h1>
            {props.compName ? ''  : <Search doSearch={getJob}/>}
        {
           // since we use this area for filtering also (via search bar), if there are no results
           jobs.length === 0 
           // then show a container saying there are no results
           ? <Container className="text-center p-5"> <h3 className="text-info">No results found. Please try again.</h3> </Container>
           // otherwise
           // looping through the entire list of companies.
            // creating a new companyCard component and passing all the data for each company.
           : jobs.map(job => (<JobCard key={job.id} data={job}/>)) 
        }
    </>)
}

export default JobList;

