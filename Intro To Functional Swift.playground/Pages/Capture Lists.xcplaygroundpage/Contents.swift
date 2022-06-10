//: [Previous](@previous)

import Foundation

// Capture Lists: A unique closure feature and how to handle it.


// Discovery State: Lets create two variables.
var a = 0
var b = 0

// Create a closure block that prints a and b
let newClosure = {print(a,b)}
newClosure

// Design Closure Array: Lets create an array whose type is () -> ().
var closureArray: [() -> ()] = []
var i = 0

// Append the closure: Lets add multiple closure blocks to the array using a for-in loop
for _ in 1...5 {
    closureArray.append {
        print(i)
    }
    i += 1
}

// Excecute the Closure
closureArray[0]()
closureArray[1]()
closureArray[3]()
closureArray[4]()
// we might have expected the closure array to print 0,1,2,3,4,5. However, each closure uses the final value of i because a closure block is a reference type


// Introducing the Capture List: A way of making a copy not referencing.
var c = 9
var d = 10
let smartClosure: () -> () = { [c,d] in
    print(c,d)
}
smartClosure()

c = 10
d = 11

smartClosure()
// The capture list, captures the values of c and d making them immutable.

// Destroying this Unique Behavior

// Design another closure block
var smartClosureArray: [() -> ()] = []
var j = 0

// Append Closure: Capture j
for _ in 1...5 {
    smartClosureArray.append { [j] in
        print(j)
    }
    j += 1
}
print(j)
// We can now rebrand j. It will be referred to as num within the closure block.
for _ in 1...5 {
    smartClosureArray.append { [num = j] in
        print(num)
    }
    j += 1
}

// Execute: Lets see if this change worked.
smartClosureArray[0]()
smartClosureArray[1]()
smartClosureArray[2]()
smartClosureArray[3]()
smartClosureArray[4]()
