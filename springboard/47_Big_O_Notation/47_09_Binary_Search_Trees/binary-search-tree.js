class Node {
  constructor(val, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

class BinarySearchTree {
  constructor(root = null) {
    this.root = root;
  }

  /** insert(val): insert a new node into the BST with value val.
   * Returns the tree. Uses iteration. */
  insert(val) {

    // if the root doesn't exist
    if (!this.root) {
      // creating a new Node
      const newNode = new Node(val);
      // setting the node to this.root
      this.root = newNode;
      // returning BinarySearchTree
      return this;
    }

    // setting the current node to the root
    let currentNode = this.root;

    // iterating until there is no current node
    while (currentNode) {

      // if the value passed is bigger than current node value
      if (val > currentNode.val) {
        // check if the right child is free
        if (currentNode.right === null) {
          // if so, create a new Node and take that spot
          currentNode.right = new Node(val);
          // return BinarySearchTree
          return this;
        } else {
          // if its not free, then go to that branch
          currentNode = currentNode.right;
        }

      }
      // if the value passed is lower than current node value
      if (val < currentNode.val) {
        // check if the left child is free
        if (currentNode.left === null) {
          // if so, create a new Node and take that spot
          currentNode.left = new Node(val);
          // return BinarySearchTree
          return this;
        }
        else {
          // if its not free, then go to that branch
          currentNode = currentNode.left;
        }

      }

      // if the value passed is already exists in BST
      if (val === currentNode.val) {
        // yell and the user
        console.log("THE VALUE ALREADY EXISTS!!!")
        // yell and the user twice
        return ("THE VALUE ALREADY EXISTS!!!")
      }
    }
  }

  /** insertRecursively(val): insert a new node into the BST with value val.
   * Returns the tree. Uses recursion. */
  // Passing this.root as default to current UNLESS its already provided
  insertRecursively(val, currentNode = this.root) {
    // if the root doesn't exist
    if (!this.root) {
      // creating a new Node
      const newNode = new Node(val);
      // setting the node to this.root
      this.root = newNode;
      // returning BinarySearchTree
      return this;
    }

    // if the value passed is bigger than current node value
    if (val > currentNode.val) {
      // check if the right child is free
      if (currentNode.right === null) {
        // if so, create a new Node and take that spot
        currentNode.right = new Node(val);
        // return BinarySearchTree
        return this;
      } else {
        // if its not free, then recurse again
        // but set the starting/current point as the right branch
        return this.insertRecursively(val, currentNode.right)
      }

    }
    // if the value passed is lower than current node value
    if (val < currentNode.val) {
      // check if the left child is free
      if (currentNode.left === null) {
        // if so, create a new Node and take that spot
        currentNode.left = new Node(val);
        // return BinarySearchTree
        return this;
      }
      else {
        // if its not free, then recurse again
        // but set the starting/current point as the left branch
        return this.insertRecursively(val, currentNode.left)
      }

    }

    // if the value passed is already exists in BST
    if (val === currentNode.val) {
      // yell and the user
      console.log("THE VALUE ALREADY EXISTS!!!")
      // yell and the user twice
      return ("THE VALUE ALREADY EXISTS!!!")
    }
  }

  /** find(val): search the tree for a node with value val.
   * return the node, if found; else undefined. Uses iteration. */
  find(val) {
    // if the root doesn't exist
    if (!this.root) {
      // return undefined
      return undefined;
    }

    // setting the current node to the root
    let currentNode = this.root;

    // iterating until there is no current node
    while (currentNode) {

      // if the value passed is sought value, return the node
      if (val === currentNode.val) {
        return currentNode;
      }

      // if the value sought is bigger than current node value
      if (val > currentNode.val) {
        // setting the current node to the right child
        currentNode = currentNode.right;
      }

      // if the value sought is lower than current node value
      else if (val < currentNode.val) {
        // setting the current node to the right child
        currentNode = currentNode.left;
      }
    }

    return undefined;
  }

  /** findRecursively(val): search the tree for a node with value val.
   * return the node, if found; else undefined. Uses recursion. */
  // Passing this.root as default to current UNLESS its already provided
  findRecursively(val, currentNode = this.root) {
    // if the root doesn't exist
    if (!this.root) {
      // return undefined
      return undefined;
    }

    // if the value passed is sought value, return the node
    if (val === currentNode.val) {
      return currentNode;
    }

    // if the value sought is bigger than current node value
    if (val > currentNode.val) {
      // check if the right child is null
      if (currentNode.right === null) {
        // if so, we reached the deep end and no other values exist to check
        // returning undefined
        return undefined;
      }
      // recursing again but with the current node being the right child
      return this.findRecursively(val, currentNode.right)
    }

    // if the value sought is lower than current node value
    else if (val < currentNode.val) {
      // check if the left child is null
      if (currentNode.left === null) {
        // if so, we reached the deep end and no other values exist to check
        // returning undefined
        return undefined;
      }
      // recursing again but with the current node being the left child
      return this.findRecursively(val, currentNode.left)
    }
  }

  /** dfsPreOrder(): Traverse the array using pre-order DFS.
   * Return an array of visited nodes. */
  dfsPreOrder() {
    // creating an array to store visited nodes
    const visitedNodes = [];

    // creating an inside function so we can recurse
    // I could have used a loop here but recursion is more interesting
    function traverse(node) {
      // since this is Pre, pushing the item to the beginning
      visitedNodes.push(node.val);
      // if there is a left node, recursing to that node
      if(node.left) traverse(node.left);
      // if there is a right node, recursing to that node
      if(node.right) traverse(node.right);
    }

    // running the custom travese function on the root
    traverse(this.root);
    // retunring the visited nodes array in the end
    return visitedNodes;
  }

  /** dfsInOrder(): Traverse the array using in-order DFS.
   * Return an array of visited nodes. */
  dfsInOrder() {
    // creating an array to store visited nodes
    const visitedNodes = [];

    // creating an inside function so we can recurse
    // I could have used a loop here but recursion is more interesting
    function traverse(node) {
      // if there is a left node, recursing to that node
      if(node.left) traverse(node.left);
      // since this is In, pushing the item to the middle
      visitedNodes.push(node.val);
      // if there is a right node, recursing to that node
      if(node.right) traverse(node.right);
    }

    // running the custom travese function on the root
    traverse(this.root);
    // retunring the visited nodes array in the end
    return visitedNodes;
  }

  /** dfsPostOrder(): Traverse the array using post-order DFS.
   * Return an array of visited nodes. */
  dfsPostOrder() {
    // creating an array to store visited nodes
    const visitedNodes = [];

    // creating an inside function so we can recurse
    // I could have used a loop here but recursion is more interesting
    function traverse(node) {
      // if there is a left node, recursing to that node
      if(node.left) traverse(node.left);
      // if there is a right node, recursing to that node
      if(node.right) traverse(node.right);
      // since this is Post, pushing the item to the end
      visitedNodes.push(node.val);
    }

    // running the custom travese function on the root
    traverse(this.root);
    // retunring the visited nodes array in the end
    return visitedNodes;
  }

  /** bfs(): Traverse the array using BFS.
   * Return an array of visited nodes. */
  bfs() {
    // creating an array of nodes to visit
    const toVisit = [];
    //creating an array of visited nodes already
    const visitedNodes = [];

    // pushing the root as the first item toVisit
    toVisit.push(this.root);

    // iterating as long as there are items in the toVisit array
    while(toVisit.length !== 0) {
      // grabbing the first item in the array and our current item
      const currentNode = toVisit.shift();
      // pushing the current value of the node as "visited"
      visitedNodes.push(currentNode.val);

      // if the current node has a left item
      if(currentNode.left) {  
        // scheduling the left item toVisit
        toVisit.push(currentNode.left);
      }
      // if the current node has a right item
      if(currentNode.right) {
        // scheduling the right item toVisit
        toVisit.push(currentNode.right);
      }
    }
    return visitedNodes;
  }

  // /** Further Study!
  //  * remove(val): Removes a node in the BST with the value val.
  //  * Returns the removed node. */

  // remove(val) {

  // }

  // /** Further Study!
  //  * isBalanced(): Returns true if the BST is balanced, false otherwise. */

  // isBalanced() {

  // }

  // /** Further Study!
  //  * findSecondHighest(): Find the second highest value in the BST, if it exists.
  //  * Otherwise return undefined. */

  // findSecondHighest() {

  // }
}

module.exports = BinarySearchTree;
