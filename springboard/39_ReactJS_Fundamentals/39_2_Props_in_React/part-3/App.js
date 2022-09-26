const App = () => (
    <div>
        <Person name="Bill Gates" age="50" hobbies={["computers", "electronics", "philantropy"]}/>
        <Person name="Evan Li" age="15" hobbies={["soccer", "cooking", "movies"]} />
        <Person name="Steve Vai" age="66" hobbies={["guitar", "music", "hiking"]} />
    </div>
);

ReactDOM.render(<App/>, document.getElementById("root"));