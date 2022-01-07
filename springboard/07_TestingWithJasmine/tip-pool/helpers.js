
// accepts 'tipAmt', 'billAmt', 'tipPercent' and sums total from allPayments objects
function sumPaymentTotal(type) {
  let total = 0;

  for (let key in allPayments) {
    let payment = allPayments[key];

    total += Number(payment[type]);
  }

  return total;
}

// converts the bill and tip amount into a tip percent
function calculateTipPercent(billAmt, tipAmt) {
  return Math.round(100 / (billAmt / tipAmt));
}

// expects a table row element, appends a newly created td element from the value
function appendTd(tr, value) {
  let newTd = document.createElement('td');
  newTd.innerText = value;

  tr.append(newTd);
}

// Step 3, creating a new function that will append a new td with an X in it and will remove the row on click
// This function is called in servers.js updateServerTable() and 
function appendDeleteBtn(tr) {
  let newTd = document.createElement('td');
  newTd.innerText = "X";

  tr.append(newTd);

  newTd.addEventListener('click', function(e) {
    e.target.parentElement.remove();
  });
}