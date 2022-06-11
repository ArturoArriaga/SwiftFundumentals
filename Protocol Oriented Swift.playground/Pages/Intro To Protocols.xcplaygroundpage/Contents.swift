//: [Previous](@previous)

import Foundation

// Intro to Protocols.
// Protocols are like coaches, they tell their players what they should do, but not how to do it.

/// Lets start by considering some issues with Object-Oriented Programming.
///  OOP Drawbacks:
///  1. Objects can become bloated, and filled with unecessary methods and properties when subclassed.
///  2. As superclasses grow, it becomes difficult to navigate between each class and fix bugs and make edits.
///  3. Mutability due to referencing can become a problem; changes made to an object can create errors.
///

// Design a protocol:
protocol Humanable {
    var name: String { get }
    var city: String { get }
    func greeting()
}


struct Texan: Humanable {
    var name: String = "Billy Joe"
    
    var city: String = "Humble"
    
    func greeting() {
        print("Howdy, I'm from \(city)")
    }
    
}

class American: Humanable {
    var name: String = "Karen"
    
    var city: String = "New York"
    
    func greeting() {
        print("Get off my lawn.")
    }
}

// Protocol Inheritance: Protocols may "inherit" the requirements of other protocols. Anything (enum, struct, object) that conforms to SuperHumanable must also implement the requirements of Humanable.
protocol SuperHumanable: Humanable {
    var superPower: String { get }
    func superAttack()
}

struct SuperHero: SuperHumanable {
    var superPower: String
    var name: String
    var city: String
    
    func superAttack() {
        print("BAM! WOW! SLAP!")
    }
    
    func greeting() {
        print("Hi there, I'm \(name) and I can \(superPower)")
    }
}

let superman = SuperHero(superPower: "Flying", name: "Superman", city: "Chicago")
superman.greeting()
superman.superAttack()


// Computed Properties and Protocols: When a class/struct/enum contains computed properties, we must consider the functionality of {get}/ {get set} in the protocol.

// Lets look at an example
protocol Breathable {
    var isBreathing: Bool { get set }
    var isLiving: Bool { get }
    
}

struct Human: Breathable {
    var isBreathing: Bool {
        get { return true }
        set {}
    }
    
    var isLiving: Bool {
        get { return true }
        set {}
    }
    
}

