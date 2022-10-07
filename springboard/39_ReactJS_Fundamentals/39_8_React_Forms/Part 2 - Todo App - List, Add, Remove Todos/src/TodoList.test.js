import React from 'react';
import { render, fireEvent } from "@testing-library/react";
import '@testing-library/jest-dom'
import TodoList from './TodoList';

// smoke test
it('renders without crashing', function() {
  render(<TodoList />);
});

it("matches snapshot", function () {
  const { asFragment } = render(<TodoList />);
  expect(asFragment()).toMatchSnapshot();
});

it("renders the form properly", function() {
  const { getByText } = render(<TodoList />);
  const newTodoInput = getByText("New task name:");
  const submitBtn = getByText("Create new todo");

  expect(newTodoInput).toBeInTheDocument();
  expect(submitBtn).toBeInTheDocument();
});

it("clears inputs after typing", function() {
  const { getByText, getByPlaceholderText } = render(<TodoList />);
  const newTodoInput = getByPlaceholderText("Type in the task name here");
  const submitBtn = getByText("Create new todo");

  fireEvent.change(newTodoInput, {target: {value: 'SomenewTodo1'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(newTodoInput).not.toHaveTextContent('SomenewTodo1');
})

it("creates a new todo", function() {
  const { getByText, getByPlaceholderText, getAllByText } = render(<TodoList />);
  const newTodoInput = getByPlaceholderText("Type in the task name here");
  const submitBtn = getByText("Create new todo");

  expect(getAllByText("X").length).toEqual(1);

  fireEvent.change(newTodoInput, {target: {value: 'SomenewTodo1'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(getAllByText("X").length).toEqual(2);
})

it("removes an existing box", function() {
  const { getByText, getByPlaceholderText, getAllByText } = render(<TodoList />);
  const newTodoInput = getByPlaceholderText("Type in the task name here");
  const submitBtn = getByText("Create new todo");

  fireEvent.change(newTodoInput, {target: {value: 'SomenewTodo1'}});

  // click on the button
  fireEvent.click(submitBtn);

  // is there a difference?
  expect(getAllByText("X").length).toEqual(2);

  fireEvent.click(getAllByText("X")[0]);

  expect(getAllByText("X").length).toEqual(1);
})
