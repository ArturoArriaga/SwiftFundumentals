//: [Previous](@previous)

import Foundation

// Delegates and Data Sources
// The delegate pattern is a pattern used to communicate (i.e.,send data) between objects that are created with classes and structs.

// Design Protocol - Let's create a protocol that contains a method that takes 'data' whose type is in String.

protocol PassDataDelegate {
    func passData(data: String)
}

// Design Delegator - The Sender of a message. This class contains an optional property whose type is PassDataDelegate?.
class FirstVC {
    var delgate: PassDataDelegate?
}
// If you try calling 'passData' from the property 'delegate', it will return nil since the delegate has not been initialized.
FirstVC().delgate?.passData(data: "Art")

// Design Delegate - The Receiver of a message.
// Let's create a second VC class that conforms to PassDataDelegate. SecondVC must contain passDataDelegate(data: String) due to protocol.

class SecondVC: PassDataDelegate {
    func passData(data: String) {
        print("I have recieved the following message: \(data)")
    }
}

// Create Instances
let firstVC = FirstVC()
let secondVC = SecondVC()
// Set the delegate to the secondVC. With this setup in place, passData can be called in the secondVC from the firstVC
firstVC.delgate = secondVC
firstVC.delgate?.passData(data: "Don't forget to throw out the trash later.")

// MARK: Data Sources
// The purpose of the data source is to be able to communicate back to the delegate.
