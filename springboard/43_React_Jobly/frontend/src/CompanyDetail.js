// react components
import React, { useState, useEffect } from 'react';
import { useParams, useHistory } from "react-router-dom";

// our custom components
import JoblyApi from './api';
import LoadingBar from './LoadingBar';
import JobList from './JobList';

// This should display the amount of jobs for this specific company
// this will be called when we click on the company card
const CompanyDetail = () => {
    // grabbing the handle from the URL params sent to us
    const { handle } = useParams();
    
    // using history so we can redirect the user later
    const history = useHistory();

    // using state to store the company in question
    const [company, setCompany] = useState();

    // grabbing a list of companY
    useEffect(() => {
        async function getComp() {
            // initial value of res is nothing
            let res = '';
    
            // trying to get the company by the handle. 
            try {
                res = await JoblyApi.getCompany(handle)
            } catch(e) {
                // logging into console if the company is not found
                console.log("CompanyDetail > useEffect > error: ",e);
            }
        
            // if the res is still nothing after the API call > company is not found, redirect to list of companies
            if(res.length === 0) { history.push('/companies') }
            // this else is a must otherwise there will be a memory leak error in dev console
            else { 
                // if the company is found, set the state as that company
                setCompany(res);
             }
        }

        // not passing anything since we just want to get the company
        getComp();

    // watching for any changes in the handle or history, if so, re-render component
    }, [handle, history])

    // showing a loading bar while the requests run
    if(!company) { return  < LoadingBar /> }

    // in the end returning a JobList component and passing the name of the company and array of jobs
    // these jobs are the ones belonging to this specific company
    return (<>
        <JobList jobs={company.jobs} compName={company.name} />
    </>)
    
}

export default CompanyDetail;