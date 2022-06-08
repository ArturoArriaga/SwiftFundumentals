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

// First Class Citizen
// In Swift, functions and closures are referred to as "First Class Citizens". This means that fuctions can be: stored in a variable/constant; be passed as a parameter; return.

// Return Closure: Lets create a function that returns a closure block.
// Option 1: Return Closure Indirectly
func returnClosure() -> ((Int, Int) -> Int) {
    return addClosures
}
let addCourse = returnClosure()
addCourse(4,10)
returnClosure()(4,10)

// Option 2: Return Closure Directly
func returnClosureDirectly() -> ((Int, Int) -> Int) {
    return { (num1, num2) in num1 + num2}
}
returnClosureDirectly()(10,10)

// Or we can use the shortened form.
func returnClosureDirectlyTwo() -> ((Int, Int) -> Int) {
    return {$0 + $1}
}
returnClosureDirectlyTwo()(100,100)


// Pass Closure: Create a function whose parameter accepts () -> String. Then, execute the closure block within the function.
func insertClosureBlock(closureBlock: () -> String) -> String {
    return closureBlock()
}
// Design ClosureBlock(): Create a closure that can be passed into the function above.
func hello() -> String {
    return "Hello World"
}

// Pass Closure Indirectly
insertClosureBlock(closureBlock: hello)
// Pass Closure Directly
insertClosureBlock(closureBlock: { return "Hello Everyone!"})
insertClosureBlock(closureBlock: {"Hi, I'm here :)"})
