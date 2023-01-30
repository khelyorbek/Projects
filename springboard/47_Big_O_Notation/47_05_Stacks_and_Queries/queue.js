/************ Node: node for a queue. ************/
class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

/************ Queue: chained-together nodes where you can
 *  remove from the front or add to the back. ************/
class Queue {
  constructor() {
    this.first = null;
    this.last = null;
    this.size = 0;
  }

  /************ enqueue(val): add new value to end of the queue. Returns undefined. ************/
  enqueue(val) {
    const newNode = new Node(val);

    if (this.first) {
      this.last.next = newNode;
      this.last = newNode;
    } else {
      this.first = newNode;
      this.last = newNode;
    }
    this.size++;
    return undefined;
  }

  /************ dequeue(): remove the node from the start of the queue
   * and return its value. Should throw an error if the queue is empty. ************/
  dequeue() {
    if(this.size === 0) { throw new Error("Queue is empty"); }

    const oldVal = this.first;
    this.first = oldVal.next;
    this.size--;
    return oldVal.val;
  }

  /************ peek(): return the value of the first node in the queue. ************/
  peek() {
    if(this.size === 0) { throw new Error("Queue is empty"); }
    return this.first.val;
  }

  /************ isEmpty(): return true if the queue is empty, otherwise false ************/
  isEmpty() {
    // if(this.size === 0) { return true } else { return false }
    return this.size === 0;
  }
}

module.exports = Queue;
