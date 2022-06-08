//: [Previous](@previous)

import Foundation

// Optional Changing is the idea that everything that follows an optional value will also be optional.
class Human {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func sayHello() {
        print("Hellow I'm \(name)")
    }
}

// This object has an optional human
class Apartment {
    var human: Human?
}


var austinApartment = Apartment()
austinApartment.human = Human(name: "Arturo Arriaga")


//var myName = austinApartment.human?.name
// A guard statement can also be used to unwrap the optional value. 
var southAustinApartment = Apartment()
if let residentName = southAustinApartment.human?.name {
    print(residentName)
} else {
    print("No Name Available")
}

