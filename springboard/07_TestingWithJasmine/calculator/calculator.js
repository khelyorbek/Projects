window.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById("calc-form");
  if (form) {
    setupIntialValues();
    form.addEventListener("submit", function(e) {
      e.preventDefault();
      update();
    });
  }
});

function getCurrentUIValues() {
  return {
    amount: +(document.getElementById("loan-amount").value),
    years: +(document.getElementById("loan-years").value),
    rate: +(document.getElementById("loan-rate").value),
  }
}

// Get the inputs from the DOM.
// Put some default values in the inputs
// Call a function to calculate the current monthly payment
function setupIntialValues() {
  
  // creating variables to store the inputs from the DOM
  const lAmount = document.getElementById("loan-amount");
  const lYears = document.getElementById("loan-years");
  const lRate = document.getElementById("loan-rate");

  // putting some default values
  lAmount.value = 125000;
  lYears.value = 30;
  lRate.value = 5;

  // creating an object and storing the values into there
  const lObj = {amount: lAmount.value, years: lYears.value, rate: lRate.value};

  // calling a function to calculate the currently monthly payment
  update();

}

// Get the current values from the UI
// Update the monthly payment
function update() {
  // console.log("Updated!");
  
  // getting the current values
  const values = getCurrentUIValues();
  // calculating the monthly payment based on the values
  // then displaying the answer into the span
  updateMonthly(calculateMonthlyPayment(values));
}

// Given an object of values (a value has amount, years and rate ),
// calculate the monthly payment.  The output should be a string
// that always has 2 decimal places.
function calculateMonthlyPayment(values) {
  // taking the object and putting it into a local variable
  let inputValues = values;
  
  // settings variables and performing arithmetics
  let P = inputValues.amount;
  let i = inputValues.rate / 12;
  let n = inputValues.years * 12;

  // running the formula per the exercise
  let monPay = (P * i) / (1-(Math.pow((1+i),-n)));

  // turning the answer into a number with 2 fixed decimals
  let monPayDec = (Math.round(monPay * 100) / 100).toFixed(2);

  // turning the float into a string
  let monPayString = monPayDec.toString();

  // returning the completed string
  return monPayString;  
}

// Given a string representing the monthly payment value,
// update the UI to show the value.
function updateMonthly(monthly) {
  // setting a variable to connect to span for Monthly Payment
  const mPayment = document.getElementById('monthly-payment');
  // setting the inner text of the element to the passed string.
  mPayment.innerText = monthly;
}
