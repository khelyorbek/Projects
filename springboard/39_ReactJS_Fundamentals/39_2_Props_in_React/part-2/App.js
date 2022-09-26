const App = () => (
    <div>
        <Tweet date="09-26-2022" autherUsername="shibaInu" autherFullname="Shiba Inu" msg="I look so fluffy!"/>
        <Tweet date="09-20-2022" autherUsername="sharPei" autherFullname="Shar Pei" msg="I look so wrinkly!"/>
        <Tweet date="08-10-2022" autherUsername="kingCavalier" autherFullname="King Cavalier" msg="I look so soft!"/>
    </div>
);

ReactDOM.render(<App />, document.getElementById("root"));
