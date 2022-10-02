import React from "react";
import { render, fireEvent } from "@testing-library/react";
import Carousel from "./Carousel";

// smoke test
it("renders without crashing", function() {
  render(<Carousel />);
});

// snapshot test
it("matches previous snapshot", function() {
  const { asFragment } = render(<Carousel />);
  expect(asFragment()).toMatchSnapshot();
})

// unit tests
it("works when you click on the right arrow", function() {
  const { queryByTestId, queryByAltText } = render(<Carousel />);

  // expect the first image to show, but not the second
  expect(queryByAltText("Photo by Richard Pasquarella on Unsplash")).toBeInTheDocument();
  expect(queryByAltText("Photo by Pratik Patel on Unsplash")).not.toBeInTheDocument();

  // move forward in the carousel
  const rightArrow = queryByTestId("right-arrow");
  fireEvent.click(rightArrow);

  // expect the second image to show, but not the first
  expect(queryByAltText("Photo by Richard Pasquarella on Unsplash")).not.toBeInTheDocument();
  expect(queryByAltText("Photo by Pratik Patel on Unsplash")).toBeInTheDocument();
});

it("works when you click on the left arrow", function() {
  const { queryByTestId, queryByAltText } = render(<Carousel />);

  // move forward in the carousel to 2nd image
  const rightArrow = queryByTestId("right-arrow");
  fireEvent.click(rightArrow);

  // expect the second image to show, but not the first
  expect(queryByAltText("Photo by Richard Pasquarella on Unsplash")).not.toBeInTheDocument();
  expect(queryByAltText("Photo by Pratik Patel on Unsplash")).toBeInTheDocument();

  // move left in the carousel
  const leftArrow = queryByTestId("left-arrow");
  fireEvent.click(leftArrow);

  // expect the first image to show, but not the second
  expect(queryByAltText("Photo by Richard Pasquarella on Unsplash")).toBeInTheDocument();
  expect(queryByAltText("Photo by Pratik Patel on Unsplash")).not.toBeInTheDocument();
});

it("hides and shows arrows appropriately", function() {
  const { getByTestId } = render(<Carousel />);
  const leftArrow = getByTestId("left-arrow");
  const rightArrow = getByTestId("right-arrow");

  // expect the left arrow to be missing, but the right button to be present.
  expect(leftArrow).toHaveStyle('visibility: hidden');
  expect(rightArrow).not.toHaveStyle('visibility: hidden');

  // move forward, expect both arrow to exist
  fireEvent.click(getByTestId("right-arrow"));
 // expect the left arrow to be missing, but the right button to be present.
 expect(leftArrow).not.toHaveStyle('visibility: hidden');
 expect(rightArrow).not.toHaveStyle('visibility: hidden');

  // move forward again, expect only the right arrow to be missing
  fireEvent.click(rightArrow);
 expect(leftArrow).not.toHaveStyle('visibility: hidden');
 expect(rightArrow).toHaveStyle('visibility: hidden');

});

// PASS  src/Carousel.test.js (54.133 s)
// ✓ renders without crashing (23 ms)
// ✓ matches previous snapshot (20 ms)
// ✓ works when you click on the right arrow (20 ms)
// ✓ works when you click on the left arrow (8 ms)
// ✓ hides and shows arrows appropriately (37 ms)

// Test Suites: 1 passed, 1 total
// Tests:       5 passed, 5 total
// Snapshots:   1 passed, 1 total
// Time:        77.071 s
// Ran all test suites matching /Carousel.test.js/i