/** TreeNode: node for a general tree. */

class TreeNode {
  constructor(val, children = []) {
    this.val = val;
    this.children = children;
  }
}

class Tree {
  constructor(root = null) {
    this.root = root;
  }

  /** sumValues(): add up all of the values in the tree. */
  sumValues() {
    // setting a sum variable to 0
    let sum = 0;

    // creating an array and putting our top parent
    const toVisitStack = [this.root];
    // console.log("toVisitStack>>>", toVisitStack)

    // looping over the array (works at least once since there is 1 parent)
    while (toVisitStack.length) {
      // grab the first element from the array
      const current = toVisitStack.pop();
      // console.log("current>>>", current)

      // handling empty arrays
      if (current !== null) {
        // add the value of that Node to array
        sum += current.val;

        // then look for all the children
        for (let child of current.children) {
          // and then add them individually to be processed
          toVisitStack.push(child);
        }
      }
    }
    // returning the sum in the end
    return sum;
  }

  /** countEvens(): count all of the nodes in the tree with even values. */
  countEvens() {
    // setting a sum variable to 0
    let sum = 0;

    // creating an array and putting our top parent
    const toVisitStack = [this.root];

    // looping over the array (works at least once since there is 1 parent)
    while (toVisitStack.length) {
      // grab the first element from the array
      const current = toVisitStack.pop();

      // if the array is not empty & the value is even
      if (current !== null && current.val % 2 !== 0) {
        // add the value of that Node to array
        sum += current.val;

        // then look for all the children
        for (let child of current.children) {
          // and then add them individually to be processed
          toVisitStack.push(child);
        }
      }
    }
    // returning the sum in the end
    return sum;
  }

  /** numGreater(lowerBound): return a count of the number of nodes
   * whose value is greater than lowerBound. */
  numGreater(lowerBound) {
    // setting a count variable to 0
    let count = 0;

    // creating an array and putting our top parent
    const toVisitStack = [this.root];
    // console.log("***", toVisitStack)
    // looping over the array (works at least once since there is 1 parent)
    while (toVisitStack.length) {
      // grab the first element from the array
      const current = toVisitStack.pop();

      // if the array is not empty
      if (current !== null) {

        // check if the value if higher than lower
        // if so, increment the count
        if(current.val > lowerBound) {++count;}
        
        // if not, then switch to children
        for (let child of current.children) {
          // and then add them individually to be processed
          toVisitStack.push(child);
        }
      }
    }
    // returning the count in the end
    return count;
  }
}

module.exports = { Tree, TreeNode };
