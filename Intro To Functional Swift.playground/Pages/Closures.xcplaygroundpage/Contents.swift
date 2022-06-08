//: [Previous](@previous)

import Foundation

// Closures
// A closure is a function without a name and the func keyword. Closures are quick and easy to carry around as a variable/constant or to pass as a parameter to another function.

// Functions
// To appreciate closures, first we design a simple function. This function adds two numbers.
func addNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

// In swift, functions are first class citizens and may be stored in a variable/constant.
var addFunction = addNumbers
addFunction(10,30)

// Introducing Closures
// Lets replicate the functionaly of above using a closure.
var addClosures: (Int, Int) -> Int = {
    (firstNum: Int, secondNum: Int) in
    return firstNum + secondNum
}

addClosures(10, 40)
// The type of addClosures is (Int, Int) -> Int. The two parameters passed in are firstNum and SecondNum and everything after the "in" keyword is the return block.

// Shortened Form
// The 'return' keyword is not required if the return block only has one line.
var addClosuresTwo: (Int, Int) -> Int = {
    (firstNum: Int, secNum: Int) in
    firstNum + secNum
}

// Return keyword required
var addClosuresThree: (Int, Int) -> Int = {
    (firstNum: Int, secNum: Int) in
    print("Adding the numbers")
    return firstNum + secNum
}


// A shorter form
// If the type is specified, an argument labels may be omitted.
var addClosuresFour: (Int, Int) -> Int = {$0 + $1}
addClosuresFour(4,5)
// here swift infers that $0 is 4 and $1 is 5
