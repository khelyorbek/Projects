// Bootstrap
import Spinner from 'react-bootstrap/Spinner';
import Container from 'react-bootstrap/Container';

const LoadingBar = () => {
    return  <>
                {/* showing a bootstrap container */}
                <Container className="text-center p-5">
                    {/* using a bootstrap spinner component */}
                    <Spinner animation="grow" role="status" variant="info"> </Spinner>
                    {/* showing just h1 with loading text */}
                    <h1 className="text-info">Loading</h1>
                </Container>
            </>
}

export default LoadingBar;