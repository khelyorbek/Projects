function curriedAdd(total) {
    if(total === undefined) return 0;

    return function add(num) {
        if(!num) return total;

        total += num;

        return add;
    }
}

module.exports = { curriedAdd };

// PASS  ./curried-add.test.js
// curriedAdd
//   ✓ returns 0 when called with no arguments (1 ms)
//   ✓ returns a function when called with an argument
//   ✓ accumulates a total with repeated function calls (1 ms)

// Test Suites: 1 passed, 1 total
// Tests:       3 passed, 3 total
// Snapshots:   0 total
// Time:        0.436 s