//: [Previous](@previous)

import Foundation

/// Protocol Extensions
// Create a protocol
protocol MadGenius {
    func createMonster()
}

// Create Extensionto MadGenius
extension MadGenius {
    func createMonster() {
        print("It's alive!!!!!")
    }
}

// Now lets create a structure that conforms to MadGenius. The extension provides a default method, so specifying it in the declaration is no longer necessary.

struct MadScientist: MadGenius {
    // If you would like to provide your on implementation, then uncomment and apply.
//    func createMonster() {
//        print("My Monster is breathing! It's ALIVEE!!!!!")
//    }
    
}
let TheBrain = MadScientist()
TheBrain.createMonster()

// A practical protocol extension
protocol FindAreaable {
    func calculateArea(side: Double, length: Double) -> String
}

// Create an extension and provide the desired implentation.
extension FindAreaable {
    func calculateArea(side: Double, length: Double) -> String {
        let area = String(side * length)
        return "The area is \(area)"
    }
}

struct Square: FindAreaable {}
struct Hexagon: FindAreaable {}
Square().calculateArea(side: 4, length: 4)
Hexagon.init().calculateArea(side: 6, length: 10)
