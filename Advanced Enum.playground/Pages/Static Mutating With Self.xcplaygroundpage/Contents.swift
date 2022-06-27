//: [Previous](@previous)
//: [Next](@next)

/*: # Static Mutating with Self
 Let's learn how to use properties and methods within enums to produce safe and beautiful code.
 
 ## Practical with Storyboard
 Create an enum with a raw value.
 */

enum Storyboard: String {
    case profile
    case setting
    case newsfeed
    
    var identifier: String {
        return self.rawValue
    }
}

// you no longer have to type manually
let profile = Storyboard.profile
profile.identifier

/*: ## API Guideline Goal
 Consider the case where you have to create a function with a parameter whose type is Storyboard.*/

func describeStoryboard(storyboard: Storyboard) -> String {
    switch storyboard {
    case .profile:
        return "\(storyboard.identifier): Profile picture, followers"
    case .setting:
        return "\(storyboard.identifier): Logout, invite"
    case .newsfeed:
        return "\(storyboard.identifier): videos, text"
    }
}

// Instead of typing manually, you are able to pick and choose any cases within Storyboard. Look familiar?
describeStoryboard(storyboard: .profile)

/*:## Mutating Method
 You can also create a mutating function that mutates its own case.*/

enum MealProcess: String {
    case breakfast, lunch, dinner
    
    var description: String {
        return self.rawValue
    }
    
    mutating func nextMeal() {
        print("Time to move on from \(self.description)")
        
        // self refers to the initialized enum object with a defined case.
        switch self {
        case .breakfast:
            self = .lunch
            print("I had a nice lunch")
        case .lunch:
            self = .dinner
            print("I had a nice dinner")
        case .dinner:
            self = .breakfast
            print("I had a nice breakfast")
        }
    }
}

/*: Let's initialize an object with the breakfast case and call the nextMeal() function. */

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()
currentMeal.nextMeal()

/*: ## Static Method
 Let's now create an enum called, AppleDevices that contains a static function that returns AppleDevices based on the name of the parameter used in the function.
 */

enum AppleDevices {
    case appleWatch, iPhone, iPad, MacbookPro, MacbookAir
    
    static func getAppleDevice(name: String) -> AppleDevices? {
        switch name {
        case "appleWatch":
            return .appleWatch
        case "iPhone":
            return .iPhone
        case "iPad":
            return .iPad
        case "MacbookPro":
            return .MacbookPro
        case "MacbookAir":
            return .MacbookAir
        default:
            return nil
        }
    }
}

// You can return an initialized enum object by calling getAppleDevice.

let userProduct = AppleDevices.getAppleDevice(name: "appleWatch")
print(userProduct!)

// Let's refactor this using raw value

enum MoreAppleDevices: String {
    case watch, iPhone, iMac, MacbookPro
    
    static func getProduct(name: String) -> MoreAppleDevices? {
        return MoreAppleDevices(rawValue: name)
    }
    
    static func getAppleDevice(enterName: String) -> MoreAppleDevices? {
        switch enterName {
        case "watch", "iPhone", "iMac", "MacbookPro":
            return getProduct(name: enterName)
        default:
            return nil
        }
    }
}
// Zen :)

/*:## Custom Init
 You can also add a custom init method to create an object you wish.*/
enum AppleDevicesMore: String {
    case watch, iPhone, mac
    
    init?(name: String) {
        if name == "watch" {
            self = .watch
        } else {
            return nil
        }
    }
}

AppleDevicesMore(name: "watch")
AppleDevicesMore(rawValue: "watch")

/*: Another example with number categories */
enum IntCategory {
    case small
    case medium
    case big
    case weird
    
    init(number: Int) {
        switch number {
        case 0..<1000:
            self = .small
        case 1000..<10000:
            self = .medium
        case 10000..<1000000:
            self = .big
        default:
            self = .weird
        }
    }
}

IntCategory(number: 123042)

/*: ## Practical Usage - HTTP Request
 Let's look at a real use case. Here we organize a group of HTTP instructions using enums instead of multiple tuples.*/

// HTTP Request
enum HttpError: String {
    case Code400 = "Bad Request"
    case Code401 = "Unauthorized"
    case Code402 = "Payment Required"
    case Code403 = "Forbidden"
    case Code404 = "Page Not Found"
    
    var description: String {
        return self.rawValue
    }
}
HttpError.Code400.description

/*:## UIColor */
enum NavigationTheme {
    case Placid
    case Warning
    case Danger
    
    var barTintColor: String {
        switch self {
        case .Placid: return "UIColor.clear"
        case .Warning: return "UIColor.blue"
        case .Danger: return "UIColor.red"
        }
        
    }
}

/*: Enums also support extensions. Let's add a custom init. */
extension NavigationTheme {
    init(numberOfTasks: Int) {
        switch numberOfTasks {
        case 0...3:
            self = .Placid
        case 4...8:
            self = .Warning
        default:
            self = .Danger
        }
    }
}

// Let's retrive barTintColor based on numberOfTasks.
let currentColor = NavigationTheme(numberOfTasks: 10).barTintColor
