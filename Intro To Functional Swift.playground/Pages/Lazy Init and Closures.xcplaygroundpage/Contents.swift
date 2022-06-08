//: [Previous](@previous)

import Foundation

// Lazy Initialization and Closures

// Create an Object with Closure
struct Human {
    init() {
        print("Born in 1987")
    }
}

// Initializing in Single Line
let art = { () -> Human  in
    let human = Human()
    return human
}()

// Now, art contains a human object

// Introducing Lazy Var
class IntenseMathProblem {
    lazy var complexNumber: Int = {
        1 * 10
    }()
}
// lazy properties are not initialized until you access them.
let problem = IntenseMathProblem() // no value for complexNumber
problem.complexNumber // complexNumber is now 10

// Rules:
// 1. Lazy can't be used with let, since there's no initial value.
// 2. Lazy can't be used with computed properties, since a CP is always recalculated.
// 3. Lazy is only valid for members of a struct or class. 
