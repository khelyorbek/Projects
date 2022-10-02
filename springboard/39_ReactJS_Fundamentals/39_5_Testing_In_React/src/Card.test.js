import React from "react";
import { render, fireEvent } from "@testing-library/react";
import Card from "./Card";

// smoke test
it("renders without crashing", function() {
    render(<Card />);
});

// snapshot test
it("matches previous snapshot", function() {
    const { asFragment } = render(<Card />);
    expect(asFragment()).toMatchSnapshot();
})

// unit tests