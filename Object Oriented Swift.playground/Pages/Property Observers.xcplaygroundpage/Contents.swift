import Foundation

// Property observers
// Tracking when something is muted or something happens.

// willSet - called just before a value is set
// didset- called immediately after a new value is set to the property.

// Grade Tracker
var myGrade: Int = 80 {
    willSet(newGrade) {
        print("About to change your grade to \(newGrade)")
    }
    didSet {
        print("Your grade has been changed.")
        print("Your previous grade was \(oldValue), and your grade is now \(myGrade)")
    }
}

// lets modify mygrade
myGrade = 100

// Step counter
// lets create a variable called totalSteps. When the variable encounters a new value, you may notify the user that the value has been changed.

var totalSteps: Int = 20 {
    willSet(newTotalSteps) {
        print("About to set the totalSteps to \(newTotalSteps)")
    }
    didSet {
        if totalSteps > oldValue {
            print("You've added \(totalSteps - oldValue) steps.")
        } else {
            print("Your step count has decreased, something went wrong.")
        }
    }
}

totalSteps = 60
totalSteps = 50


// Application
// Notify the user or change the background color once the user successfuly logs into the app.

var userLoginInfo: Bool = false {
    willSet(newValue) {
        print("The user has initiated a change")
    }
    didSet {
        if userLoginInfo {
            print("The user has swtiched from \(oldValue) to \(userLoginInfo)")
            // background color
            // animation
            // pop up
            // all kinds of stuff
        }
    }
}


userLoginInfo = true

// Like a computed property, a property observer is always recalculated even if the value has not changed.

// Difference between computed properties and property observers: Property observers have a default value and it is observed rather than calculated.
// willSet and didSet are not called when a variable is initialized. 
