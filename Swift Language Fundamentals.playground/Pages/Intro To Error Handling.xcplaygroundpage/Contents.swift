//: [Previous](@previous)

import Foundation
import Darwin

// Error Handling
// Is nothing more than another else-if statement.

// Primary use cases:
// To alter that some error can occur.
// How to use a do-try block.
// Distinguishing between try?, try!, and try.

// Example designing a saftey feature.
// This function checks if a rider is below or above 4 meters.

func checkHeight(height: Int) {
    if height > 200 {
        print("Rider is too tall - Entry not permited.")
    } else if height < 140 {
        print("Rider is too short - Entry not permited.")
    } else {
        print("Entry Allowed")
    }
}

//let riderOne = checkHeight(height:300)
//let riderTwo = checkHeight(height: 150)

// Primary concerns are the bloated-ness, lack of modularity, clarity of the function.


// Improved error design

enum HeightError: Error {
    case maxHeight
    case minHeight
}

func checkHeightError(_ height: Int) throws {
    if height > 200 {
        throw HeightError.maxHeight
    } else if height < 140 {
        throw HeightError.minHeight
    } else {
        print("Entry Permited")
    }
}


// Calling and handling the error
// Functions that throw errors must be called w/ a do-try block.

let riderHeight = 203
do {
    try checkHeightError(riderHeight)
} catch HeightError.maxHeight {
    print("Rider is too tall - Entry Denied.")
} catch HeightError.minHeight {
    print("Rider is too short - Entry Denied.")
}


// Error Handling with Object Initialization.
// Design Error

enum NameError: Error {
    case noName
}

// Design a throwable class
class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("You've created the course \(name)")
        }
    }
}

// create an object using try within a do-catch block

do {
    let myCourse = try Course(name:"")
} catch NameError.noName {
    print("Error: please enter valid name")
}

do {
    let summerCourse = try Course(name: "CSCI E65")
} catch NameError.noName {
    print("No name entered")
}

// Distinguising between try?, try! and try
// Try is only used within a do-try block; the other two can be used outside.

// try? returns an optional type. If it throws an error, the result is nil.
let newCourse = try? Course(name: "CSCIE-60")
let secondCourse = try? Course(name: "")
// try! returns a normal type but if the method/init throws an error, it will crash.
let fallCourseOne = try! Course(name:"Intro to AI")
//let fallCourseTwo = try! Course(name:"")


