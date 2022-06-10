//: [Previous](@previous)

import Foundation

// MARK: Trailing Closures
// Problem: A closure block is too long to pass into a function.

// Design a function: This funciton takes in two parameters, an Int and a () -> void.
func trailingClosure(number: Int, closure: () -> Void) {
    print("You've entered this \(number)")
    closure()
}

// Now design the closure block to be passed in.
func helloFunc() -> Void {
    print("Hello World I'm a Function")
}
helloFunc()

let helloClosure = {
    print("Hello World, I'm a Closure!")
}

// Execute the function with both variations.
trailingClosure(number: 100, closure: helloFunc)
trailingClosure(number: 200, closure: helloClosure)

// If a function's last parameter is a closure, we may beautify.
// Trailing closure # 1
trailingClosure(number: 300, closure: {print("This is pretty/ ")})
// Trailing closure # 2
trailingClosure(number: 400) {
    print("This is a beauty!!")
}


// Let's look at another example.
func anotherTrailingClosure(num: Int, closure: (Int) -> Int) {
    let newNumber = closure(num)
    print(newNumber)
}

// Since the last parameter of this function takes in another function whose signature is (Int) -> Int, we can use a trailing closure block instead.

// Option #1: Without the trailing closure
anotherTrailingClosure(num: 500, closure: {number in number * number})
// Option #2: With the trailing closure
anotherTrailingClosure(num: 600) { number in
    number * number
}
// Option #3: A beauty
anotherTrailingClosure(num: 700) { $0 * $0 }
