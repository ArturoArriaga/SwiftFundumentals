//: [Previous](@previous)
//: [Next](@next)

/*: # Class vs. Struct
 To understand the difference between structs and classes, you must understand the difference between value and reference types.
 
 
 ## Primary Goals:
 1. Understand that the differences extend beyond inheritance.
 1. Understand when to use a class vs a struct.
 */


/*: Design a Class */
class HumanClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}

/*: Create an instance */
var humanClassObject = HumanClass(name: "Art")
humanClassObject.name

// Now let's create another instance that "copies" humanClassObject.
let newHumanClassObject = humanClassObject
humanClassObject.name = "Arturo"
newHumanClassObject.name
// the name property in the new instance has also changed.

/*: Design with Struct */
struct HumanStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// Now create an instance.
var structObject = HumanStruct(name: "Art")
let newStructObject = structObject
// Let's change the name, as we did for the class object.
structObject.name = "Arturo"
newStructObject.name
// The name of the newStuctObject remains unchanged.

/*: The reason the name did not change for the newStuctObject like it did for the newHumanObject is because when using a struct, an instance that "copies" the new instance creates an identical copy of the object (i.e., the object is not shared.

For class objects, when you create an instance that "copies", the new instance shares the object with the original instance */

/*: ## Mutability
 Because of the difference stated abobe, there is an interesting discrepancy when it comes to creating instances with let. Let's observe.
 */

/*: ## Mutability in Classes
 Let's create in instance with let and attempt to mutate its property. */

class ArtClass {
    var name = "Art"
}

let artClass = ArtClass()
artClass.name = "Arturo"

let newArtClass = artClass
newArtClass.name = "Arturo iOS Developer"
artClass.name

// Although the instance, artClass was created with let, the property of it has been mutated. This is possible because the instance does not own the object, instead, it has a reference to ArtClass in the memory (i.e. cloud/RAM).

/*: ## No Mutability in Stucts */
struct ArtStruct {
    var name = "Art"
}

let artStruct = ArtStruct()
artStruct.name
// artStruct.name = "Artie" // This is not allowed and will flag an error.

/*: With structs, when an instance is created with a constant, let, it's not possible to mutate its property since the instance has its own copy and the let protects anyone from interfering with its own instance.*/
