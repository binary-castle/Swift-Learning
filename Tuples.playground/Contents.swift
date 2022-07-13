import Foundation

print("Let's go with tuples!")

let me: (name: String, age: Int) = ("Anand", 30)

print("Me: \(me)") // Prints (name: "Anand", age: 30)

// This is a function that returns a tuple
func buildPerson() -> (firstName: String, age: Int) {
    return ("Anand", 30)
}

let anotherMe = buildPerson()
print("Another Me: \(anotherMe)")

if me == anotherMe {
    print("We are the same!") // Asserts to true because the data is same
} else {
    print("We are different!")
}

let someone = ("Anand", 30)
print("Someone: \(someone)")

if me == someone {
    print("I am that someone") // Asserts to true because the data in each indices are same
} else {
    print("I am not someone")
}

let anotherMeWithDifferentSignature: (age: Int, name: String) = (30, "Anand")
print("AnotherMeWithDifferentSignature: \(anotherMeWithDifferentSignature)")

// Binary operator '==' cannot be applied to operands of
// type '(name: String, age: Int)' and '(age: Int, name: String)'
// if person == unknown {
//     print("We are the same!")
// } else {
//     print("We are different!")
// }

let (name, age) = someone

print("Destructured someone -> name = \(name) age = \(age)")

switch someone {
//case let (name, age) where age >= 18 && age <= 50:
//    print("\(name) has age between 18 and 50 #1")
//    fallthrough
case (let name, 0...18):
    print("\(name) has age less than 18")
case (let name, 18...50):
    print("\(name) has age between 18 and 50")
case (let name, 51...70):
    print("\(name) has age between 51 and 70")
default:
    print("Someone is something else")
}
