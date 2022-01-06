
it('should calculate the monthly rate correctly', function () {
  const lObj = {amount: 1000, years: 10, rate: 2};
  expect(calculateMonthlyPayment(lObj)).toBeCloseTo(166.67,2);
});


it("should return a result with 2 decimal places", function() {
  // ..
  const lObj = {amount: 125000, years: 30, rate: 5};
  expect(calculateMonthlyPayment(lObj)).toBeCloseTo(52083.33,2);
});

it("should not have a negative number for monthly rate", () => {
  const lObj = {amount: 5000, years: 2, rate: 3};
  expect(calculateMonthlyPayment(lObj)).toBeGreaterThan(0);
})

it("should not have a negative number for inputs", () => {
  const lObj = {amount: 25000, years: 10, rate: 15};
  expect(lObj.amount).toBeGreaterThan(0);
  expect(lObj.years).toBeGreaterThan(0);
  expect(lObj.rate).toBeGreaterThan(0);
})
