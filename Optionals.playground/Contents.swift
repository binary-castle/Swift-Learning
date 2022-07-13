import Foundation

var greeting: String? = "Hello, playground"

greeting = nil

if let greeting {
    print(greeting)
} else {
    print("Greeting is nil")
}
