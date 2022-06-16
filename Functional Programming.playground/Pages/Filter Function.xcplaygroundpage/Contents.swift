import Foundation

// Working with the filter function

// The iterative way of doing things
var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}
evens

// creating the array and imediately filtering it
let filterEvens = Array(1...10).filter { number in
    number % 2 == 0
}
filterEvens

// using the shorter syntax
let filterOdds = Array(1...10).filter { $0 % 2 == 1 }
filterOdds

// An iterative approach to filtering
let recentGrades = ["A", "A", "B", "C", "A"]
var goodGrades: [String] = []
for grade in recentGrades {
    if grade == "A" {
        goodGrades.append(grade)
    } else {
        print("A grade of \(grade) is below expecations")
    }
}
goodGrades

// A closure block that returns true or false
var isGradeAcceptable: (String) -> Bool = { grade in return grade == "A" }
isGradeAcceptable = { $0 == "A" }
//isGradeAcceptable("A")
//isGradeAcceptable("B")
//isGradeAcceptable("C")

// This creates a function that takes in a closure block, whose type is (String) -> Bool, that can be called by an
// operation parameter.
func simpleStringFilter(grades: [String], operation: (String) -> Bool) -> [String] {
    var desiredGrades: [String] = []
    for grade in grades {
        if operation(grade) {
            desiredGrades.append(grade)
        }
    }
    return desiredGrades
}
// within this function the operation closure is executed. If it returns true, the value that was passed in is added to the output array.

let getGrades = simpleStringFilter(grades: recentGrades, operation: isGradeAcceptable)


// Pass Closure Directly
let artsGrades = ["A", "A", "A", "B", "A"]
let irvsGrades = ["A", "B", "A", "C", "B"]
let getArtsGrades = simpleStringFilter(grades: recentGrades, operation: { element in return element == "A"})
getArtsGrades
let getIrvsGrades = simpleStringFilter(grades: recentGrades, operation: { $0 == "A" })
irvsGrades

// Generic Function, that does the same thing as above, but is generalized to all types
func myFilter<T>(array:[T], operation:(T) -> Bool) -> [T] {
    var result: [T] = []
    for element in array {
        if operation(element) {
            result.append(element)
        }
    }
    return result
}

// Filter numbers
let gradesAsValues = myFilter(array: Array(1...100), operation: { $0 >= 93 && $0 <= 100 })
gradesAsValues

// Vote counting
let answer = [true, false, true, false, false, false]
let trueAnswer = myFilter(array: answer, operation: {$0 == true})
trueAnswer

// Built-In Swift Filter
let zeroToHund = Array(1...100).filter({$0 % 2 == 0})
print(zeroToHund)
let zeroToFif = Array(1...100).filter({$0 % 2 == 0}).filter({$0 <= 50})
print(zeroToFif)

let numbers = [1,2,3,4].map { number in
    return [number + number]
}

print(numbers)












