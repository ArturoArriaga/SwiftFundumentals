//: [Previous](@previous)

import Foundation

// Failable Init
// Designing an init method that, at first might return no object (i.e. nil), but then could throw an error.

// Error handling review
// Design an error
enum NameError: Error {
    case noName
}

// Design Struct
struct HarvardCourse {
    let courseName: String
    
    init(name: String) throws {
        if name.isEmpty {
            throw NameError.noName
        }
        
        self.courseName = name
    }
}

// Initialize and Handle Error
do {
    let myCourse = try HarvardCourse(name: "CSCI E-65: Intro to Mobile Programming with Swift.")
    myCourse.courseName
} catch NameError.noName {
    print("Please enter a course name.")
}


// Design Failable Init
// To do this, insert ? after the init keyword. It may return nil or an object whose type is optional.

class Blog {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            // handle error
            return nil
        }
        
        self.name = name
    }
}

let blog = Blog(name: "")
if let myBlog = blog {
    print(myBlog.name)
}


// Both error handling and failable init are the same. Error handling is probably a cleaner approach. 
