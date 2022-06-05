//: [Previous](@previous)

import Foundation

// The guard statement
// Another form of writing an else-if statement in swift that adds clarity.

// Addresses the following issues:
// Providing an alternate way of expressing an else-if statement
// Safely unwrapping multiple optionals.


// The typical else-if statement: primary issues being the nested brackets and needed to read every line.
func checkDrinkingAge(_ ofAge: Bool) {
    let canDrink = ofAge
    if canDrink {
        print("Entry permited")
    } else {
        print("Entry denied")
    }
}

// Guard Statement
// Only runs if the condition is false, and will exit through the return statement. If the condition is true, Swift will ignore the guard block (providing early exit and fewer brackets.

func checkDrinkProgram(_ ofAge: Bool) {
    let permited = ofAge
    guard permited else {
        print("Entry Denied")
        return
    }
    print("Entry permited")
}

checkDrinkProgram(false)


// Unwrap Optionals with Else-If
var publicName: String? = "Arturo Arriaga"
var publicPhoto: String? = "Arturos.png"
var publicAge: Int? = nil

// A bad idea
//func unwrapOneByOne(n: String?, p: String?, a: Int?) {
//    if let name = publicName {
//        if let photo = publicPhoto {
//            if let age = publicAge {
//                print("Art: \(name), \(photo), \(age)")
//            } else {
//                print("Age is missing")
//            }
//        } else {
//            print("photo is missing")
//        }
//    } else {
//        print("Name is missing")
//    }
//}

//unwrapOneByOne(n: publicName, p: publicPhoto, a: publicAge)
var artsName: String? = nil
var artsPhoto: String? = nil
var artsAge: Int? = 2
//unwrapOneByOne(n: artsName, p: artsPhoto, a: artsAge)
// very difficult to read


//// Slightly better version
//func unwrapBetter() {
//    if let name = publicName {
//        print("Yes Name")
//    } else {
//        print("No name")
//        return
//    }
//}

// The Guard Statement

func unwrapOneByOneWithGuard(n: String?, p: String?, a: Int?) {
    guard let name = publicName else {
        print("Name is Missing")
        return
    }
    
    guard let photo = publicPhoto else {
        print("Photo is missing")
        return
    }
    
    guard let age = artsAge else {
        print("Age is missing")
        return
    }
    
    print(name)
    print(photo)
    print(age)
    
}
// it'll only excecute off all three guard statements are fulfilled.
unwrapOneByOneWithGuard(n: publicName, p: publicPhoto, a: artsAge)


// unwrap multiple optionals with guard statement

func unwrapWithGuard(n: String?, p: String?, a: Int?) {
    guard let name = publicName, let photo = publicPhoto, let age = artsAge else {
        print("Something went wrong")
        return
    }
    print("Your name is \(name). Your photo is \(photo). You are \(age) years old")
}

unwrapWithGuard(n: publicName, p: publicPhoto, a: publicAge)

// The defer statement
// A statement that excecutes only after the current scope has ended.
func simpleDefer() {
    defer { print("This happens second")}
    print("This happens first")
}

simpleDefer()

for i in 1...3 {
    defer { print("Now print this \(i)")}
    print("Printing this \(i) first")
}
