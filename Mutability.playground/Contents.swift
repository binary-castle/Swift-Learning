import Foundation

// Struct with mutable parameters

struct MutablePerson {
    var name: String {
        willSet {
            print("MutablePerson name willSet \(self.name)")
        }
        didSet {
            print("MutablePerson name didSet \(self.name)")
        }
    }
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("MutablePerson: Initialized with parameterized initializer")
    }

}

let me = MutablePerson(name: "Anand", age: 30)

// Swift forbids the below commented statement becase me is a let constant,
// hence cannot be mutated.

// me.name = "Foo"

// This copies the state, but doesn't invoke the initializer
var meCopy = me

func mutatePerson(person: inout MutablePerson) {
    person.name = "Foo"
}

mutatePerson(person: &meCopy)
// This is okay, because name is declared as var
meCopy.name = "Foo"

print("Mutable Me Name: \(me.name) Age: \(me.age)")
print("Mutable Me (Copy) Name: \(meCopy.name) Age: \(meCopy.age)")

struct ImmutablePerson {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("ImmutablePerson: Initialized with parameterized initializer")
    }
}

let immutableMe = ImmutablePerson(name: "Anand", age: 30)

// Swift forbids the below commented statement becase me is a let constant,
// hence cannot be mutated.

// immutableMe.name = "Foo"

var immutableMeCopy = immutableMe

// Swift forbids the below commented statement becase ImmutablePerson.name
// is a let constant, hence cannot be mutated.

// immutableMeCopy.name = "Foo"

print("Immutable Me Name: \(immutableMe.name) Age: \(immutableMe.age)")
print("Immutable Me (Copy) Name: \(immutableMeCopy.name) Age: \(immutableMeCopy.age)")
