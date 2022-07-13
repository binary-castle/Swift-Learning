import Foundation

// Enumerations in Swift can be stateful

enum Fruits {
    case Apple(count: Int)
    case Banana
    case Orange
    case Grapes
}

extension Fruits {
    func getName() -> String {
        switch (self) {
        case .Apple(let count): return "Apple \(count)"
        case .Banana: return "Banana"
        case .Orange: return "Orange"
        case .Grapes: return "Grapes"
        }
    }
}

let fruits: [Fruits] = [.Apple(count: 5), .Banana, .Orange, .Grapes]

fruits.forEach { fruit in
    print(fruit.getName())
}
