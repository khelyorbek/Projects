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

// PASS  src/NewBoxForm.test.js (28.937s)
// PASS  src/App.test.js (33.012s)
// PASS  src/BoxList.test.js (41.528s)
// PASS  src/Box.test.js (49.744s)

// Test Suites: 4 passed, 4 total
// Tests:       12 passed, 12 total
// Snapshots:   4 passed, 4 total
// Time:        62.101s