//: [Previous](@previous)

import Foundation

class Human {
    
    var name: String
    init(name: String) {
        self.name = name
    }
    
    
    func sayHello() {
        print("Hellow I'm \(name)")
    }
}

class Apartment {
    var human: Human?
}


var austinApartment = Apartment()
austinApartment.human = Human(name: "Arturo Arriaga")


//var myName = austinApartment.human?.name

var southAustinApartment = Apartment()
if let residentName = southAustinApartment.human?.name {
    print(residentName)
} else {
    print("No Name Available")
}

