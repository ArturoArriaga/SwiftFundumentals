import Foundation

/// MARK: Completion Handlers - A way of performing an operation after something else has happened.*

// Design the handler block: Create the closure that will be called within a function.
let handlerBlock: (Bool) -> () = {
    if $0 {
        print("Download Completed")
    }
}

let myHandlerBlock: (Bool) -> () = { (isSuccess: Bool) in
    if isSuccess {
        print("Download has finished.")
    }
}

myHandlerBlock(true)

// Design Function: create a function that mimics downloading an image with a for-loop and notify the user once the download is complete.

func downloadImage(completionBlock: (Bool) -> Void) {
    for _ in 1...10 {
        print("Downloading...")
    }
    completionBlock(true)
}
downloadImage(completionBlock: myHandlerBlock)


// Pass closure directly: Another alternative is to pass the closure directly using a trailing closure.

downloadImage { (isSuccess: Bool) in
    if isSuccess {
        print("Download is complete. Thank you")
    }
}
