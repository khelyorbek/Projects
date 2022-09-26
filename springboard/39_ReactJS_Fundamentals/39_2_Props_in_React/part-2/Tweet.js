const Tweet = (props) => {
    return (
        <div>
            
            <p>Date: {props.date}</p>
            <p>Auther username: {props.autherUsername}</p>
            <p>Auther fullname: {props.autherFullname}</p>
            <p>Tweet message: {props.msg}</p>
            <hr></hr>
        </div>
    );
}