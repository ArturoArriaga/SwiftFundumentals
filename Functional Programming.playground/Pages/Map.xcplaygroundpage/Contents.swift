//: [Previous](@previous)

import Foundation

// The Map Function
// Mapping each element in a collection to an operation.
// Map = Manipulate

// Iterative Approach
// Square each element in an array.

var squaredNumbers: [Double] = []
var numbers = [1.0, 2.0, 3.0, 4.0]
for number in numbers {
    squaredNumbers.append(number * number)
}
squaredNumbers

// The build-in Map Function
let mappedNumbers = numbers.map({ $0 * $0 })
mappedNumbers

// Non-Generic Map Function
// In this declaration, the operation parameter takes in any function that takes in a double and returns a double. The result of the entire function returns a collection of doubles.
func myMap(numbers: [Double], operation: (Double) -> Double) -> [Double]{
    var result: [Double] = []
    for number in numbers {
        let transformedValue = operation(number)
        result.append(transformedValue)
    }
    return result
}

let longerVersion = myMap(numbers: [1, 2, 3, 4, 5]) { (number) -> Double in
    number * number
}
longerVersion

let shorterVersion = myMap(numbers: [1,10,20,30], operation: {$0 * $0})
shorterVersion

// Slightly Generic Map
func slightlyGenericMap<T>(_ items: [T], _ operation: (T) -> T) -> [T] {
    var result = [T]()
    for item in items {
        result.append(operation(item))
    }
    return result
}

// Lowercase Each element
// Lets use this method to lowercase each element in an array whose type is string.

let upperCaseLetters = ["DANNY", "EDWARD", "MICKEY"]
// helper function that meets our operations signature requirements

func lowercase(enterstring: String) -> String {
    return enterstring.lowercased()
}

// Pass closure
// This works because what is being passed into the generic function is a function and the rest is performed within the generic function.
let lettersMapped = slightlyGenericMap(upperCaseLetters, lowercase)

// Pass Closure w/ the Longer form
let changeToLowercase = ["TEXAS", "CALIFORNIA", "COLORADO"]
let changed = slightlyGenericMap(changeToLowercase) { (letter) -> String in
    letter.lowercased()
}

// Pass Closer w/ Shorter Form
let shorterForm = slightlyGenericMap(changeToLowercase) { $0.lowercased() }
shorterForm

// Extremely Generic Map
// Here we desire to convert all elements from one type to another for the output.

func convertNumberToString(number: Int) -> String {
    return "You are number \(String(number))"
}

func genericMap<T,U>(_ items: [T], _ operation: (T) -> U) -> [U] {
    var results = [U]()
    for item in items {
        results.append(operation(item))
    }
    return results
}


// Manipulare Number to String
let myNumbers = [1,2,3,4,5]
genericMap(myNumbers, convertNumberToString)

let genericMapLongForm = genericMap(myNumbers) { (number) -> String in
    return "This number \(String(number))"
}

let genericMapShortForm = genericMap(myNumbers) { "You're number \(String($0))" }
genericMapShortForm 

let moreNumbers = [1,2,3,4,5].map { [$0] }
moreNumbers

let someNumbers = Array(0..<5)
someNumbers
someNumbers.map { number in
    return [number]
}


let r = [0,1,2].map { num in
    return [num, num]
}

let c = [0,1,2].map({[$0,$0]})
print(c)

let com = Array(zip(r,c).flatMap({$0}))
print(com)
