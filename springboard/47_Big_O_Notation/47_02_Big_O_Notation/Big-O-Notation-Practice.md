# Step One: Simplifying Expressions
Simplify the following big O expressions as much as possible:

**Q: O(n + 10)**

**A:** O(n)

**Q: O(100 * n)**

**A:** O(n)

**Q: O(25)**

**A:** O(1)

**Q: O(n^2 + n^3)**

**A:** O(n^3)

**Q: O(n + n + n + n)**

**A:** O(n)

**Q: O(1000 * log(n) + n)**

**A:** O(n)

**Q: O(1000 * n * log(n) + n)**

**A:** O(n log(n))

**Q: O(2^n + n^2)**

**A:** O(2^n)

**Q: O(5 + 3 + 1)**

**A:** O(1)

**Q: O(n + n^(1/2) + n^2 + n * log(n)^10)**

**A:** O(n^2)


# Step Two: Calculating Time Complexity
Determine the time complexities for each of the following functions. If you’re not sure what these functions do, copy and paste them into the console and experiment with different inputs!
## First
```
function logUpTo(n) {
  for (let i = 1; i <= n; i++) {
    console.log(i);
  }
}
```
Time Complexity: O(n)
## Second
```
function logAtLeast10(n) {
  for (let i = 1; i <= Math.max(n, 10); i++) {
    console.log(i);
  }
}
```
Time Complexity: O(n)
## Third
```
function logAtMost10(n) {
  for (let i = 1; i <= Math.min(n, 10); i++) {
    console.log(i);
  }
}
```
Time Complexity: O(1)
## Fourth
```
function onlyElementsAtEvenIndex(array) {
  let newArray = [];
  for (let i = 0; i < array.length; i++) {
    if (i % 2 === 0) {
      newArray.push(array[i]);
    }
  }
  return newArray;
}
``` 
Time Complexity: O(n) but also space complexity O(n)
## Fifth
```
function subtotals(array) {
  let subtotalArray = [];
  for (let i = 0; i < array.length; i++) {
    let subtotal = 0;
    for (let j = 0; j <= i; j++) {
      subtotal += array[j];
    }
    subtotalArray.push(subtotal);
  }
  return subtotalArray;
}
```
Time Complexity: O(n^2)
## Sixth
```
function vowelCount(str) {
  let vowelCount = {};
  const vowels = "aeiouAEIOU";

  for (let char of str) {
    if(vowels.includes(char)) {
      if(char in vowelCount) {
        vowelCount[char] += 1;
      } else {
        vowelCount[char] = 1;
      }
    }
  }

  return vowelCount;
}
```
Time Complexity: O(n)

# Part 3 - short answer
Answer the following questions

**True** or false: n^2 + n is O(n^2)

True or **false**: n^2 * n is O(n^3).

True or **false**: n^2 + n is O(n).

What’s the time complexity of the .indexOf array method?
O(n)

What’s the time complexity of the .includes array method?
O(n)

What’s the time complexity of the .forEach array method?
O(n)

What’s the time complexity of the .sort array method?
O(n log n)

What’s the time complexity of the .unshift array method?
O(n)

What’s the time complexity of the .push array method?
O(1)

What’s the time complexity of the .splice array method?
O(1)- false. Its O(n) and O(1) if its the end of array.

What’s the time complexity of the .pop array method?
O(1)

What’s the time complexity of the Object.keys() function?
O(n)
