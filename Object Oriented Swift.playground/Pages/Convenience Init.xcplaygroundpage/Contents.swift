//: [Previous](@previous)
//: [Next](@next)
import Foundation

/*: #Convenience Initializers
 Initialize objects quickly. */

// Here we create a class with a designated initializer.
class Human {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    // A convencience init initializes the designated init method.
    convenience init() {
        self.init(name: "Arturo Arriaga")
    }
}

let art = Human(name: "Art Arriaga")
let artie = Human()

art.name
artie.name
