class Node {
  constructor(value, adjacent = new Set()) {
    this.value = value;
    this.adjacent = adjacent;
  }
}

class Graph {
  constructor() {
    this.nodes = new Set();
  }

  // this function accepts a Node instance and adds it to the nodes property on the graph
  addVertex(vertex) {
    this.nodes.add(vertex);
  }

  // this function accepts an array of Node instances and adds them to the nodes property on the graph
  addVertices(vertexArray) {
    for (let v of vertexArray) {
      this.nodes.add(v);
    }
  }

  // this function accepts two vertices and updates their adjacent values to include the other vertex
  addEdge(v1, v2) {
    v1.adjacent.add(v2);
    v2.adjacent.add(v1);
  }

  // this function accepts two vertices and updates their adjacent values to remove the other vertex
  removeEdge(v1, v2) {
    v1.adjacent.delete(v2)
    v2.adjacent.delete(v1)
  }

  // this function accepts a vertex and removes it from the nodes property, it also updates any adjacency lists that include that vertex
  removeVertex(vertex) {
    this.nodes.delete(vertex);
  }

  // this function returns an array of Node values using DFS
  depthFirstSearch(start) {
    const toVisit = [start];
    const visited = new Set(toVisit);
    const nodeVals = [];

    // console.log("toVisit >>> ", toVisit);

    while (toVisit.length) {
      const currItem = toVisit.pop();

      visited.add(currItem);
      nodeVals.push(currItem.value);

      // console.log("currItem >>> ", currItem);

      for (let child of currItem.adjacent) {
        // console.log("child >>>", child);

        // console.log("visited before >>> ", visited);
        if (!visited.has(child)) {
          toVisit.push(child);
          visited.add(child);
          // nodeVals.push(child.value)

          // console.log("visited after >>> ", visited);
          // console.log("nodeVals after >>> ", nodeVals);
        }

      }
    }
    console.log("nodeVals END >>> ", nodeVals);
    return nodeVals;
  }

  // this function returns an array of Node values using BFS
  breadthFirstSearch(start) {
    const toVisit = [start];
    const visited = new Set(toVisit);
    const nodeVals = [start.value];

    // console.log("toVisit >>> ", toVisit);

    while (toVisit.length) {
      const currItem = toVisit.shift();
      // console.log("currItem >>> ", currItem);

      for (let child of currItem.adjacent) {
        // console.log("child >>>", child);

        // console.log("visited before >>> ", visited);

        if (!visited.has(child)) {
          toVisit.push(child);
          visited.add(child);
          nodeVals.push(child.value)

          // console.log("visited after >>> ", visited);
          // console.log("nodeVals after >>> ", nodeVals);
        }

      }
    }
    console.log("nodeVals END >>> ", nodeVals);
    return nodeVals;
  }
}

module.exports = { Graph, Node }