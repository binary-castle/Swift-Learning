import Foundation

struct Address {
    var address: String
    
    init(address: String) {
        self.address = address
        print("Initialized Address")
    }
}

struct Person {
    // Lazy properties are initialized on calling it. It will not be initialized
    // if you don't call it.
    lazy var address = Address(address: "Address for \(self.name)")
    
    // Property with attached observers
    var name: String {
        willSet {
            print("willSet replace name \(self.name) with \(newValue)")
        }
        didSet {
            print("didSet name \(self.name)")
        }
    }
    
    // Stored property
    var age: Int
    
    // Computed property which doesn't have a backing field
    // Derives from name and age
    var nameAndAge: String {
        get {
            return "\(self.name), \(self.age)"
        }
    }
}

// During initialization, the observers of properties are not triggered.
var person = Person(name: "No Name", age: 30)

// This will trigger the observers
person.name = "Anand"

// The lazy property is not initialized until you explicitly calls it.
print(person)

// Here the lazy property will be initialized
print(person.address)

// Reading the computed property. Writing will not be possible because we don't have a setter.
print(person.nameAndAge)
