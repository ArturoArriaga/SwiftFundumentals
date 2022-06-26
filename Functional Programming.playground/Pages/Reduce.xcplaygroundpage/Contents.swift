/*:
 # Reduce
 The reduce function is used to combine multiple things into one.
 */

import Foundation

/*:
 The Imperative Approach: Let's demonstrate how this could be useful by first showing how you would add up everythin in a collection using imperative style programming. 
 */

var numberOne = Int()
for number in Array(1...10) {
    numberOne += number
}
numberOne

/*: Here's an other implementation, however, using subtraction.
 Subtract all numbers in an array */

var numberTwo = Int()
for number in Array(1...10) {
    numberTwo -= number
}
numberTwo

/*:  Declarative / Functional Approach */

let added = Array(1...10).reduce(0, {$0 + $1 })
added
let subtracted = Array(1...10).reduce(0, {$0 + $1})
subtracted

/*: Custom implementation */ 
func myReduce(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) {
    var current = seed
    for number in numbers {
        current = operation(current, number)
    }
}
// seed represents an initial value to start off with
let testMyReduce = myReduce(0, numbers: Array(1...10)) { $0 + $1 }

// Finding the max
let maxNumber = Array(1...10).reduce(0, {(total, number) in max(total, number)})
maxNumber
let biggestNumber = Array(1...100).reduce(0, {max($0, $1)})
biggestNumber

// A modified version of myReduce
func reduct(_ seed: Int, numbers: [Int], operation: (Int, Int) -> Int) -> Int {
    var current = seed
    for number in numbers {
        current = operation(current, number)
    }
    return current
}

let testReduce = reduct(0, numbers: Array(1...100)) { $0 + $1 }
print(testMyReduce)

var numberOfDaysPerMonth: [Int:Int] = [1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31].filter({$0.key < 9})
print(numberOfDaysPerMonth)



