//: [Previous](@previous)

import Foundation

// Overriding
// Mastering the words super and override.

// create vehicle class
class Vehicle {
    var description: String {
        return "Hello, I'm moving at 50 mph"
    }
    
    func warning() {
        print("Danger!")
    }
}


// Override Method and Property
// Create a class called, ToyCar and inherit Vehicle. You may customize inherited properties and methods by inserting override. You may access inherited properites and methods by calling super.

class ToyCar: Vehicle {
    override var description: String {
        return "\(super.description). Hey I'm going pretty fast."
    }
    
    override func warning() {
        print("Vehicle has exceeded the speed limit.")
        super.warning()
    }
}

// Now lets access the description property and the warning method of ToyCar.

let myFutureCar = ToyCar()
myFutureCar.description
myFutureCar.warning()

// Super Init
// You may also override an init method from the superclass. Every property must be initialized even the ones from the super class.

// Design Super Class: Create a class that contains a propery called, origin.
class Human {
    var origin: String
    
    init(enterOrigin: String) {
        origin = enterOrigin
    }
}

// Design a Subclass: This should inherit from human and will contain a property called, name. However, when initialized, origin must be initialized first and can be done by calling super.init.

class Mexican: Human {
    let city: String
    
    init(enterCity: String) {
        self.city = enterCity
        super.init(enterOrigin: "CDMX")
    }
    
    init(enterCity: String, origin: String) {
        self.city = enterCity
        super.init(enterOrigin: origin)
    }
}
