//: [Previous](@previous)

import Foundation

// The zip() function is designed to merge two sequences into a single sequence of tuples.

let firtNames = ["Arturo", "Irvin", "Delia"]
let lastNames = ["Arriaga", "Castellanos", "Rosado"]
let fullNames = Array(zip(firtNames, lastNames))
print(fullNames)
