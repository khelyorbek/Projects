import React from 'react';
import { render } from "@testing-library/react";
import App from './App';

// smoke test
it('renders without crashing', function() {
  render(<App />);
});

it("matches snapshot", function () {
  const { asFragment } = render(<App />);
  expect(asFragment()).toMatchSnapshot();
});

// PASS  src/App.test.js (29.224s)
// PASS  src/Todo.test.js (31.508s)
// PASS  src/TodoList.test.js (39.908s)
// PASS  src/NewTodoForm.test.js (49.277s)
// › 1 snapshot written.

// Snapshot Summary
// › 1 snapshot written from 1 test suite.

// Test Suites: 4 passed, 4 total
// Tests:       12 passed, 12 total
// Snapshots:   1 written, 3 passed, 4 total
// Time:        58.499s