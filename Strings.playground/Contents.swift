import Foundation

var greeting = "Hello, playground"

// MARK: Swift strings are unlike char arrays.
// You cannot access char / substring with integer indices.
// Instead, define an index (String.Index) like this:

let index = greeting.index(greeting.startIndex, offsetBy: 1)
let char = greeting[index]
print(char)

let startIndex = greeting.index(greeting.startIndex, offsetBy: 2)
let endIndex = greeting.index(greeting.startIndex, offsetBy: 4)

// Substring references to the original string storage, instead of
// allocating additional memory for keeping the copied part of string.
// Efficient and memory saving.
let substr = greeting[startIndex...endIndex]
print(substr)
