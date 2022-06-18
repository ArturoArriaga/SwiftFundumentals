import Foundation

// MARK: Automatic Reference Counting
// Swift uses the ARC system to manage memory.

// What is memory? There are two primary places to store data. 1. RAM or 2. Hard Disk. The term "memory" refers to the management of RAM. When an object is initialized, it is physically store on RAM. Since the space is limited, the object should be removed when unsused. The process is known as deallocation. Let's learn how to deallocate objects using ARC.

// Design a Passport - This class contains two properties whose types are Human? and String.
class Passport {
    var human: Human?
    let citizenship: String
    
    init(citizenship: String) {
        self.citizenship = citizenship
        print("\(citizenship) passports generated.")
    }
    
    deinit {
        print("passport being destroyed.")
    }
}

class Human {
    var passport: Passport?
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) generated.")
    }
    
    deinit {
        print("I \(name), am gone.")
    }
}
