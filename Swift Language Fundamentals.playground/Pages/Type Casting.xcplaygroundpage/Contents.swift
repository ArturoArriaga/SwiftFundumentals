//: [Previous](@previous)

import Foundation

// Type casting - converting between types.

// The purpose of as, as?, as!


// Human Class
class Human {
    func introduce() {
        print("Hi, I'm a human")
    }
}

// Some human subclasses
class Mexican: Human {
    func singLaChona() {
        print("Y la chona se mueve")
    }
}

class American: Human {
    func singNationalAnthem() {
        print("O Say Can you See")
    }
}

// instantiate some instances.

let arturo = Mexican()
let irvin = American()

arturo.introduce()
irvin.introduce()
arturo.singLaChona()
irvin.singNationalAnthem()

// Type Casting - Converting A merican to a human. There are two forms: upcasting and downcasting.

let delia = arturo as Human
delia.introduce()

// Upcasting w/ a stuct
var name = "Arturo" as Any
var number = 20 as Any
var anyArray = [name, number] as Any // This works even though they are structs not class objs

// Downcasting - can fail, so be careful.

// Force downcasting -
//let newValue = anyArray[0] as? String
// there must have been some changes because this didn't work.

let zay = Mexican()
let isaac = American()
let steph = Mexican()
let art = American()

//let humans: [Human] = [zay as Human, isaac as Human, steph as Human, art as Human]

let humans: [Human] = [zay, isaac, steph, art]

for human in humans {
    if let mexican = human as? Mexican {
        print("sings")
        mexican.singLaChona()
    }
    
    if let american = human as? American {
        print("sings")
        american.singNationalAnthem()
    }
    
    
}

