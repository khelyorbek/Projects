// Part 1
class Vehicle {
    // Create a class for vehicle. Each vehicle instance should have the following properties: make, model, year
    constructor(make,model,year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    // Each vehicle instance should have access to a method called honk, which returns the string “Beep.”
    honk() {
        return "Beep";
    }

    // Each vehicle instance should have a method called toString, which returns the string containing the make, model and year.
    toString() {
        return "The vehicle is a " + this.make + " " + this.model + " from " + this.year;
    }
}

// Part 2
    // Create a class for a car. The Car class should inherit from Vehicle and each car instance should have a property called numWheels which has a value of 4.
class Car extends Vehicle{
    constructor(a,b,c) {
        super(a,b,c);
        this.numWheels = 4;
    }
}

// Part 3
    // Create a class for a Motorcycle. This class should inherit from Vehicle and each motorcycle instance should have a property called numWheels which has a value of 2. It should also have a revEngine method which returns “VROOM!!!”
class Motorcycle extends Vehicle {
    constructor(a,b,c) {
        super(a,b,c);
        this.numWheels = 2;
        this.revEngine = () => {return "VROOM!!!";}
    }
}

// Part 4
    // Create a class for a Garage. It should have a property called vehicles which will store an array of vehicles, and a property called capacity which is a number indicating how many vehicles will fit in the garage. When you create a garage, vehicles will always be empty; you only need to provide the capacity.

    // A garage should also have an add method, which attempts to add a vehicle to the array of vehicles. However, if you try to add something which is not a vehicle, the garage should return the message “Only vehicles are allowed in here!”. Also, if the garage is at capacity, it should say “Sorry, we’re full.”

class Garage {
    constructor(cap) {
        this.vehicles = [];
        this.capacity = cap;
    }

    add(veh) {
        // The teach used instanceof instead of <. I worked with what I knew.
        // if (!(newVehicle instanceof Vehicle)) {
        if(this.vehicles.length < this.capacity) {
            if(Number.isFinite(veh.numWheels)) {
                this.vehicles.push(veh);
                return "Vehicle added";
            } else {
                return "Only vehicles are allowed in here!";
            }
        } else {
            return "Sorry, we're full."
        } 
    }
}