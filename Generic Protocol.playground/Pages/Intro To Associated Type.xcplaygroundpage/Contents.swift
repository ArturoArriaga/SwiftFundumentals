//: [Previous](@previous)

import Foundation

// MARK: Intro to Associated Type.
// Let's learn how to make protocol requirements generic, providing freedom and scalability.

// Design Generic Struct - Review.
// The following stuct has one property. When you initialize an instance of this struct, you can define T implicitly or explicitly.

struct GenericStruct<T> {
    var property: T?
}

let explicitly = GenericStruct<Bool>() // T is a Bool
let implicitly = GenericStruct(property: "Art") // T is a String

// Design a Normal Protocol.
protocol NormalProtocol {
    var property: String { get set }
}

// Design a class that conforms to this protocol.
class NormalClass: NormalProtocol {
    var property: String = "Arturo"
}
// Because 'property' is defined as a string, this limits the type of object that can be put in it.

// Introducing the Generic Protocol.
// When desinging a protocol, you can define an associated type, which is analogous to a typealias. However, unlike typealias, the type is not defined.
protocol GenericProtocol {
    associatedtype myType
    var anyType: myType { get set }
}
// The type of myType, will be defined by the class/struct/enum that creates it.

// Define Associated Type
struct SomeStruct: GenericProtocol {
    var anyType = 1990
}

struct AnotherStruct: GenericProtocol {
    var anyType = "Arturo Arriaga"
}

// Define the Associated Type using the Typealias.
struct ExplicitStruct: GenericProtocol {
    typealias myType = Bool
    var anyType = true

}
