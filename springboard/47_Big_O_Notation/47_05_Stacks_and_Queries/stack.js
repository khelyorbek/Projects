/************ Node: node for a stack. ************/
class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

/************ Stack: chained-together nodes where you can
 *  remove from the top or add to the top. *************/
class Stack {
  constructor() {
    this.first = null;
    this.last = null;
    this.size = 0;
  }

  /************ push(val): add new value to end of the stack (first item). Returns undefined. ************/
  push(val) {
    const newNode = new Node(val);

    if (this.first) {
      newNode.next = this.first;
      this.first = newNode;
    } else {
      this.first = newNode;
      this.last = newNode;
    }
    this.size++;
    return undefined;
  }

  /************ pop(): remove the node from the top of the stack (first item)
   * and return its value. Should throw an error if the stack is empty. ************/
  pop() {
    if(this.size === 0) { throw Error("queue is empty")}

    const oldVal = this.first;
    this.first = oldVal.next;
    this.size--;
    return oldVal.val;
  }

  /************ peek(): return the value of the first node in the stack. ************/
  peek() {
    if(this.size === 0) { throw Error("queue is empty")}
    return this.first.val;
  }

  /************ isEmpty(): return true if the stack is empty, otherwise false ************/
  isEmpty() {
    if(this.size === 0) { return true } else { return false }
  }
}

module.exports = Stack;
