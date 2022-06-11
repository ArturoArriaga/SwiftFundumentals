//: [Previous](@previous)

import Foundation

// Computed Property
// Creating relationships between variables.

// Problem: Is there an alternative to using functions?

// Bad, unrelated functions that take up many lines.
func getDiameter(radius: Double) -> Double {
    return radius * 2
}

func getRadius(diameter: Double) -> Double {
    return diameter / 2
}


getDiameter(radius: 10)
getRadius(diameter: 200)
// The two functions are separate without any relationship between them.

//Introducing the Computed Property.
// Creating a variable that is read only - referred to as gettable.

// A gettable property.
class NumberClass {
    var readableNumber: Double {
        get {
            return 777
        }
    }
    
    var anotherReadableNumber: Double {
        return 789
    }
    
//    readableNumber = 10 this will fail if attempted.
}

// Gettable and settable properties
var radius: Double = 10
var diameter: Double {
    get {
        return radius * 2
    }
    set {
        radius = newValue / 2
    }
}

// new value refers to the newly set value of diameter.

diameter = 50
radius = 100
diameter

// A different name can be used instead of newValue.
var side: Double = 100
var area: Double {
    get {
        return side * side
    }
    set(newArea) {
        side = sqrt(newArea)
    }
}

side
area


var currentPaycheck: Int = 1500
var nextPaycheck: Int {
    get {
        return currentPaycheck + 1500
    }
    set(theFollowingCheck) {
        currentPaycheck = theFollowingCheck + 2000
    }
}

currentPaycheck // 1500
nextPaycheck // 1500 + 1500
currentPaycheck = 4500 // the sum the previous two
nextPaycheck // 4500 + 1500
nextPaycheck = 6000
currentPaycheck // 6000 + 2000, line 80






