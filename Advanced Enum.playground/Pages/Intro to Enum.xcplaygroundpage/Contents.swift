//: [Previous](@previous)
//: [Next](@next)

/*: # Intro To Enum
 
 Let's review the basics of using enums in swift.
 
 Typed of Enumeration
 1. Basic Enumerations
 1. Enumerations with Raw Values
 1. Enumerations with Associated Values
 
 
 ## Basic Enumerations
 Let's create an Enum called 'Compass' that contains 4 cases.
 */

import Darwin

enum Compass {
    case north
    case south
    case east
    case west
}

/*: Alternitavely, you can define multiple cases in a single line. When you are ready to initialize an object, choose one of the cases. */
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earth = Planet.earth

/*: You can also run through a switch statement to identify the enum type. */
switch earth {
case .earth:
    print("The safest planet to humans")
default:
    print("This planet is not habitable.")
}

/*:
 ## Raw Value
 An enumeration can contain a value. Swift supports the following types for the value of enum:
 1. Int
 1. Float
 1. String
 1. Bool
 
 ### Raw Value: String
 */
enum Food: String {
    case pizza
    case banana
    case chicken
    case salad
}

let stringValueFromPizza = Food.pizza.rawValue
print(stringValueFromPizza)


/*: ### Raw Value: Int */
enum Days: Int {
    case mon, tue, wed, thurs, fri = 10, sat, sun
}
// mon = 0, tues = 1....fri = 10, sat = 11

let fri = Days.fri.rawValue
print(fri)

let mon = Days.mon.rawValue
print(mon)

enum Months: Int {
    case Jan = 1
    case Feb = 2
    case March = 3
}


/*: ## Initialization from Raw Value
You can try to create an enum object using a raw value, but it could fail; In such a case, the returned object would be nil.
 */

let possibleDay = Days(rawValue: 10) // returns an optional
print(possibleDay!)

// You can also combine it with a switch statement.

if let someday = Days(rawValue: 3) {
    switch someday {
    case .sat, .sun:
        print("It's the weekend, time to have some fun!")
    default:
        print("Work day. 😫 ")
    }
} else {
    print("Enter a valid day")
}


/*:## Associated Value
 Each case may contain value along with it*/
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var qrCode = Barcode.qrCode("XZXZXZXZX")
var upcCode = Barcode.upc(2, 0, 12, 20)

/*: ## Validation
 Determine if the instance is .qrCode using an else-if statement. The process is similar to implicit unwrapping. */
if case let Barcode.qrCode(value) = qrCode {
    print("this is a qr code")
    print(value)
}

/*: You can capture the associated value of the instance, qrCode using 'case let'. You've named the captured value as 'value'. */

// Let's determine whether the upcCode instance is .upcCode.
if case let Barcode.upc(numberSystem, manufacturer, product, check) = upcCode {
    print("numbersystem:", numberSystem)
    print("manufaturer:", manufacturer)
    print("product:", product)
    print("check:", check)
}

// Validation with Switch statement: instead of checking each enum object individually using an else-if, you could also use a switch statement.

let code = upcCode
switch code {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

// The code above looks confusing, let's clean it up using the case let syntax
switch code {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}
