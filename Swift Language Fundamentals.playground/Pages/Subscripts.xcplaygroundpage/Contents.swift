//: [Previous](@previous)
//: [Next](@next)
import Foundation

// Subscripts - A way to make a shortcut instead of calling a method.
// Normal Method
struct HelloKitty {
    func saySomething() -> String {
        return "I'm cute"
    }
}

// creating an instance and calling method.
let babe = HelloKitty()
babe.saySomething()

// subscripts are analogous to methods, except without a name.
struct Weekdays {
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

// Called by adding []
let myDays = Weekdays()
myDays[0]
myDays[1]

// Use case w/ dictionary; normally returns an optional type
var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]
let height = info["Height"] // returns optional

// Artificial Dictionary - accessing the element w/out returning an optional type.
struct HealthInfo {
    var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]
    
    subscript(key: String) -> Double {
        if let newInfo = info[key] {
            return newInfo
        } else {
            return 0
        }
    }
}

// Elements are now accessible
let art = HealthInfo()
art["Height"]
art["Body Fat"]
art["Weight"]
