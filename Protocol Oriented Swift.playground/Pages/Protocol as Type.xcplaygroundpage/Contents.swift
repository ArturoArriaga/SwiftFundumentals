//: [Previous](@previous)

import Foundation

// MARK: Protocol as Type
// Using a protocol as a type allows us to group objects together through protocols.
// It can be used as an alternative to type casting.

// Design Protocol
protocol Texan {
    var wearsCowboyHat: Bool { get }
    var origin: String { get }
}

// Extend Protocol
extension Texan {
    // Extensions cannot contain stored properties.
    var wearsCowboyHat: Bool {
        return true
    }
}

// Create Blueprints - Let's create some structs that conform to 'American'
struct Austinite: Texan {
    var origin: String = "Austin, Texas"
}

class Houstonian: Texan {
    var origin: String = "Houston, Texas"
}

struct RGVer: Texan {
    var origin: String = "Rio Grande Valley, Texas"
}

// Protocol as Type - We can now group elements that conform to the Texan protocol.
let texans: [Texan] = [Austinite(), Houstonian(), RGVer()]
// This array's type is 'Texan' and since every element contains origin, you may loop through it.
texans.forEach { person in
    print("I'm from \(person.origin)")
}


// Protocol and Generics
protocol Valuable {
    var price: String { get }
}
// Now let's create some objects/structures
struct Diamond: Valuable {
    var price: String = "$1000.00 USD - Very High."
}

struct Ruby: Valuable {
    var price: String = "100.00 USD - Gets the job done."
}

class Glass: Valuable {
    var price: String = "$1.00 USD - Cheap"
}

// Create a generic function with a parameter whose type must conform to Valuable.
func stateThePrice<T: Valuable>(enterGem: T) {
    print("My value is currently \(enterGem.price)")
}
stateThePrice(enterGem: Diamond())
stateThePrice(enterGem: Ruby())
stateThePrice(enterGem: Glass())
