/*************** Node: node for a singly linked list. ***************/
class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

/*************** LinkedList: chained together nodes. ***************/
class LinkedList {
  constructor(vals = []) {
    this.head = null;
    this.tail = null;
    this.length = 0;

    for (let val of vals) this.push(val);
  }

  /*************** push(val): add new value to end of list. ***************/
  push(val) {
    const newNode = new Node(val);

    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
      this.length++;
    } else {
      this.tail.next = newNode;
      this.tail = newNode;
      this.length++;
    }
  }

  /*************** unshift(val): add new value to start of list. ***************/
  unshift(val) {
    const newNode = new Node(val);

    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
      this.length++;
    } else {
      newNode.next = this.head;
      this.head = newNode
      this.length++;
    }

  }

  /*************** pop(): return & remove last item. ***************/
  pop() {
    return this.removeAt(this.length-1);
  }

  /** shift(): return & remove first item. */
  shift() {
    return this.removeAt(0)
  }

  /*************** getAt(idx): get val at idx. ***************/
  getAt(idx) {
    if (idx < 0 || idx >= this.length) {
      throw ("index is invalid")
    }

    if (idx < 0 || idx >= this.length) {
      throw ("index is invalid")
    }

    for (let i = 0; i <= this.length; i++) {
      if (i === idx) {
        return this.head.val;
      }
      this.head = this.head.next;
    }
  }

  /*************** setAt(idx, val): set val at idx to val ***************/
  setAt(idx, val) {
    if (idx < 0 || idx >= this.length) {
      throw ("index is invalid")
    }

    let temp = this.head;
    let counter = 0;

    while (temp) {
      // console.log("temp ", counter, " >>> ", temp);

      if (counter === idx) {
        temp.val = val;
      }

      temp = temp.next;
      counter++;
    }

    // console.log("Array >>> ", this);
  }

  /*************** insertAt(idx, val): add node w/val before idx. ***************/
  insertAt(idx, val) {
    // console.log("LENGTH >>>", this.length);

    // if the idx is below zero or bigger than length of array
    if (idx < 0 || idx > this.length) {
      // throw an error
      throw ("index is invalid")
    }

    // creating a new node from the value
    const newNode = new Node(val);

    // initiating our left and right values
    let left;
    let right;
    // setting a temp variable to use as a moving "head"
    let temp = this.head;
    // setting a counter to track iterations
    let counter = 0;

    // if there is nothing in array
    if (!this.head) {
      // make it the first item
      this.head = newNode;
      this.tail = newNode;
      // increase the length of array
      this.length++;

    // if there are item in array
    } else {
      // iterate until you reach the ceilling (ifx requested)
      // we don't want continue the iteration after we are done setting the new value
      while (temp && counter <= idx) {
        // console.log("temp ", counter, " >>> ", temp);

        // if our counter (index) matches the idx needed - 1 (left)
        if (counter === idx - 1) {
          // setting the left to the node
          left = temp;
        }

        // if our counter (index) matches the idx (spot we need)
        if (counter === idx) {
          // setting the right to the node
          right = temp;
        }

        // moving to the next node
        temp = temp.next;
        // increasing the counter tracker
        counter++;
      }

      // if we are adding item into the end
      if(idx >= this.length) {
        // setting the tail as the new item
        this.tail = newNode;
      }

      // telling the left item that our new node is after them
      left.next = newNode;
      // telling our node that the next item after them is right
      newNode.next = right;
      // increasing the length of array
      this.length++;

      // returning undefined per instructions
      return undefined;
    }
  }

  /*************** removeAt(idx): return & remove item at idx, ***************/
  removeAt(idx) {
    if (idx < 0 || idx >= this.length) {
      throw ("index is invalid")
    }

    console.log('IDX >>> ', idx);

    // setting a temp variable to use as a moving "head"
    let temp = this.head;
    // setting a counter to track iterations
    let counter = 0;

    // console.log("LENGTH >>>", this.length);

    // if the removed item is the only item in the array
    if(this.length === 1) {
      // grabbing the value so we can return it later
      const val = this.head;
      // setting the length to 0
      this.length = 0;
      // settings the head to null
      this.head = null;
      // setting the tail to null
      this.tail = null;
      // returning the value
      return val.val;
    }

    // iterate until you reach the ceilling (idx requested)
      // we don't want continue the iteration after we are done setting the new value
      while (temp && counter <= idx) {
        // console.log("temp ", counter, " >>> ", temp);

        // if idx is first item in list
        if(idx === 0) {
          const val = temp;
          this.head = temp.next;
          // reducing the array length by 1
          this.length--;
          return val.val;
        } 

        // if the idx is the last item in list
        // currently on 1 item before the last
        // and the index to be removed is the last one

        console.log("Counter >>> ", counter);
        if(counter === idx - 1 && idx === this.length -1) {
          
          // grabbing the last item so we can return it
          const val = temp.next;
          console.log("VAL >>>", val.val)
          // setting the 1 item before last to new tail
          this.tail = temp;
          // reducing the array length by 1
          this.length--;
          // returning the last item
          return val.val;
        } 
        
        // if the idx is anything in between
        // going to the idx - 1
        if(counter === idx - 1 && idx !== this.length -1) {
          // grabbing the next item which is our idx to be removed
          const val = temp.next;
          // setting the idx - 1 items next value to next.next (skipping our idx)
          temp.next = temp.next.next;
          // reducing the array length by 1
          this.length--;
          // returning our value that we "removed"
          return val.val;
        }

        // if none of the conditiona above match moving to the next node
        temp = temp.next;
        // increasing the counter tracker
        counter++;
      }
  }

  /*************** average(): return an average of all values in the list ***************/
  average() {
    if (this.length === 0) { return 0 }

    let sum = 0;

    while (this.head) {
      sum += this.head.val;
      this.head = this.head.next;
    }

    return sum / this.length;
  }
}

module.exports = LinkedList;
