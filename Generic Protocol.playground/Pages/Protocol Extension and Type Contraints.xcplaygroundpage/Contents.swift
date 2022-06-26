//: [Previous](@previous)

import Foundation

// MARK: Protocol Extension and Type Constraints
// Constraints can be added to a protocol extension so that the default implementation only applies to specific classes and structs. This limits the scope of Protocol Extension with 'where' and 'Self' keywords.

// Generic Function - Let's create a class LOL and create a function that can only accept a parameter whose type is LOL.
class LOL {}
func addLOLClassOnly<T:LOL>(array: [T]) {}
addLOLClassOnly(array: [LOL()])

// Design Protocol.
protocol GenericProtocol {
    associatedtype myType
}

class SomeClass: GenericProtocol {
    typealias myType = String
}

class SomeStruct: GenericProtocol {
    typealias myType = Int
}

// Design Protocol Extension - Constraints/conditions can be added to 'extension' by adding a where clause.
extension GenericProtocol where myType == String {
    static func introduct() {
        print("Hi, I'm Arturo")
    }
}
// Now all classes, structs, and enums with myType as String contain the introduce() static method.
SomeClass.introduct()
//SomeStruct.introduct()

// Another 'where' clasue may also be added.
extension GenericProtocol where myType == String, Self == SomeClass {
    static func introduce() {
        print("Hello, it's nice to meet you.")
    }
}

// Design a Pre-Defined Associated Type: A final option is to pre-define the type within the protocol.
protocol FamilyProtocol {
    associatedtype familyType = Int
    var familyMembers: [familyType] { get set}
}

// Now, if you create a struct that conforms to Family Protocol, the required property, familyMembers has to be of type [Int].
struct NumberFamily: FamilyProtocol {
    var familyMembers: [Int] = [1, 3, 10, 15]
}
