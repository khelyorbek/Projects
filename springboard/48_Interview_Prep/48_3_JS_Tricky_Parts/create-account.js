function createAccount(pin, amount) {
    let accountPin = pin;
    let accountAmt = amount || 0;

    return {
        checkBalance(inputPin) {
            if (inputPin === accountPin) {
                return `$${accountAmt}`;
            } else {
                return "Invalid PIN.";
            }
        },
        deposit(inputPin, inputAmt) {
            if (inputPin === accountPin) {
                accountAmt += inputAmt;
                return `Succesfully deposited $${inputAmt}. Current balance: $${accountAmt}.`
            } else {
                return "Invalid PIN.";
            }
        },
        withdraw(inputPin, inputAmt) {
            if (inputPin === accountPin) {
                if (accountAmt - inputAmt < 0) {
                    return "Withdrawal amount exceeds account balance. Transaction cancelled."
                } else {
                    accountAmt -= inputAmt;
                    return `Succesfully withdrew $${inputAmt}. Current balance: $${accountAmt}.`
                }

            } else {
                return "Invalid PIN.";
            }
        },
        changePin(oldPin, newPin) {
            if (oldPin === accountPin) {
                accountPin = newPin;
                return "PIN successfully changed!";
            } else {
                return "Invalid PIN.";
            }
        }
    }
}

module.exports = { createAccount };

// PASS  ./create-account.test.js
// createAccount
//   ✓ has four methods on it (2 ms)
//   ✓ accepts an optional starting balance as a second argument (1 ms)
//   checkBalance
//     ✓ returns 'Invalid PIN.' if the PIN doesn't match
//     ✓ returns the balance if the pin is correct
//   deposit
//     ✓ returns 'Invalid PIN.' if the PIN doesn't match (1 ms)
//     ✓ adds the amount to the account balance (1 ms)
//   withdraw
//     ✓ returns 'Invalid PIN.' if the PIN doesn't match
//     ✓ subtracts the amount from the account balance
//     ✓ prohibits you from withdrawing more than you have (1 ms)
//   changePin
//     ✓ returns 'Invalid PIN.' if the PIN doesn't match
//     ✓ changes the PIN with a success message if the PIN matches

// Test Suites: 1 passed, 1 total
// Tests:       11 passed, 11 total
// Snapshots:   0 total
// Time:        0.442 s, estimated 1 s