import React from 'react';
import { render, fireEvent } from "@testing-library/react";
import '@testing-library/jest-dom'
import BoxList from './BoxList';

// smoke test
it('renders without crashing', function() {
  render(<BoxList />);
});

it("matches snapshot", function () {
  const { asFragment } = render(<BoxList />);
  expect(asFragment()).toMatchSnapshot();
});

it("renders the form properly", function() {
  const { getByText } = render(<BoxList />);
  const widthInput = getByText("Width:");
  const heightInput = getByText("Height:");
  const submitBtn = getByText("Create new box");

  expect(widthInput).toBeInTheDocument();
  expect(heightInput).toBeInTheDocument();
  expect(submitBtn).toBeInTheDocument();
});

it("clears inputs after typing", function() {
  const { getByText, getByPlaceholderText } = render(<BoxList />);
  const widthInput = getByPlaceholderText("Type in the width here");
  const heightInput = getByPlaceholderText("Type in the height here");
  const submitBtn = getByText("Create new box");

  fireEvent.change(widthInput, {target: {value: '300'}});
  fireEvent.change(heightInput, {target: {value: '300'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(widthInput).not.toHaveTextContent('300');
  expect(heightInput).not.toHaveTextContent('300');
})

it("creates a new box", function() {
  const { getByText, getByPlaceholderText, getAllByText } = render(<BoxList />);
  const widthInput = getByPlaceholderText("Type in the width here");
  const heightInput = getByPlaceholderText("Type in the height here");
  const submitBtn = getByText("Create new box");

  expect(getAllByText("REMOVE").length).toEqual(1);

  fireEvent.change(widthInput, {target: {value: '300'}});
  fireEvent.change(heightInput, {target: {value: '300'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(getAllByText("REMOVE").length).toEqual(2);
})

it("removes an existing box", function() {
  const { getByText, getByPlaceholderText, getAllByText } = render(<BoxList />);
  const widthInput = getByPlaceholderText("Type in the width here");
  const heightInput = getByPlaceholderText("Type in the height here");
  const submitBtn = getByText("Create new box");

  fireEvent.change(widthInput, {target: {value: '300'}});
  fireEvent.change(heightInput, {target: {value: '300'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(getAllByText("REMOVE").length).toEqual(2);

  fireEvent.click(getAllByText("REMOVE")[0]);

  expect(getAllByText("REMOVE").length).toEqual(1);
})
