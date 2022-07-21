import Foundation

// This property wrapper keeps an integer field to bound within a range of value.
// Out-of-bounds write will be internally stored, but capped when read.
// This wrapper also allows to access the exact value using the $<property name> keyword.
// This is just nothing more than some syntactic sugar to Swift.

@propertyWrapper
struct IntBounds {
    // Backing field
    var value: Int
    // Constants for tweaking the property wrapper
    let minValue: Int
    let maxValue: Int
    // An initializer to ensure minValue <= maxValue and initialize value with minValue
    init (minValue: Int, maxValue: Int) {
        if (minValue > maxValue) {
            fatalError("minValue cannot be greater than maxValue")
        }
        self.minValue = minValue
        self.maxValue = maxValue
        self.value = minValue
    }
    
    var wrappedValue: Int {
        get {
            if (value > maxValue) { return maxValue }
            if (value < minValue) { return minValue }
            return value
        }
        set {
            value = newValue
        }
    }
    
    var projectedValue: Int {
        get {
            return value
        }
        set {
            value = newValue
        }
    }
}

struct Counter {
    @IntBounds(minValue: 5, maxValue: 10) var count: Int
    
    mutating func increment() {
        count = count + 1
    }
    
    mutating func decrement() {
        count = count - 1
    }
}

var counter = Counter()

for i in 0...12 {
    print("Iteration: \(i) Wrapped Value: \(counter.count) Projected Value: \(counter.$count)")
    counter.increment()
}

for i in 0...12 {
    print("Iteration: \(i) Wrapped Value: \(counter.count) Projected Value: \(counter.$count)")
    counter.decrement()
}
