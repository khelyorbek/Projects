// Bootstrap
import Spinner from 'react-bootstrap/Spinner';
import Container from 'react-bootstrap/Container';

const LoadingBar = () => {
    return  <>
                <Container className="text-center p-5">
                    <Spinner animation="grow" role="status" variant="info"> </Spinner>
                    <h1 className="text-info">Loading</h1>
                </Container>
            </>
}

export default LoadingBar;