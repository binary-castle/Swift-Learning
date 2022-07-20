import Foundation

public protocol Expression {
    var name: String { get }
    var value: Double { get }
}

public struct Constant : Expression {
    public let name: String
    public let value: Double

    public init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
}

public struct Addition<Left: Expression, Right: Expression> : Expression {
    let left: Left
    let right: Right
    
    public var name: String {
        get {
            return "\(left.name) + \(right.name)"
        }
    }
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var value: Double {
        get {
            return left.value + right.value
        }
    }
}

public struct Subtraction<Left: Expression, Right: Expression> : Expression {
    let left: Left
    let right: Right
    
    public var name: String {
        get {
            return "\(left.name) - \(right.name)"
        }
    }
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    public var value: Double {
        get {
            return left.value - right.value
        }
    }
}

public struct Multiplication<Left: Expression, Right: Expression> : Expression {
    let left: Left
    let right: Right
    
    public var name: String {
        get {
            return "\(left.name) * \(right.name)"
        }
    }
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    public var value: Double {
        get {
            return left.value * right.value
        }
    }
}

public struct Division<Left: Expression, Right: Expression> : Expression {
    let left: Left
    let right: Right
    
    public var name: String {
        get {
            return "\(left.name) / \(right.name)"
        }
    }
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var value: Double {
        get {
            return left.value / right.value
        }
    }
}

public struct Group<T: Expression> : Expression {
    let enclosed: T
    public var name: String {
        get {
            return "(\(enclosed.name))"
        }
    }
    
    public init(enclosed: T) {
        self.enclosed = enclosed
    }
    
    public var value: Double {
        get {
            return enclosed.value
        }
    }
}

public struct Squared<T: Expression> : Expression {
    let enclosed: T
    public var name: String {
        get {
            return "\(enclosed.name)²"
        }
    }
    
    public init(enclosed: T) {
        self.enclosed = enclosed
    }
    
    public var value: Double {
        get {
            return pow(enclosed.value, 2)
        }
    }
}

public extension Expression {
    func prettyPrint() {
        print("\(self.name) = \(self.value)")
    }
}

public func buildAdditionSquaredShortExpression(a: some Expression, b: some Expression) -> some Expression {
    return Squared(enclosed: Group(enclosed: Addition(left: a, right: b)))
}

public func buildAdditionSquaredExpandedExpression(a: some Expression, b: some Expression) -> some Expression {
    let a2 = Squared(enclosed: a)
    let const2 = Constant(name: "2", value: 2)
    let ab2 = Multiplication(left: const2, right: Multiplication(left: a, right: b))
    let b2 = Squared(enclosed: b)
    return Addition(left: Addition(left: a2, right: b2), right: ab2)
}

public func buildSubtractionSquaredShortExpression(a: some Expression, b: some Expression) -> some Expression {
    return Squared(enclosed: Group(enclosed: Subtraction(left: a, right: b)))
}

public func buildSubtractionSquaredExpandedExpression(a: some Expression, b: some Expression) -> some Expression {
    let a2 = Squared(enclosed: a)
    let const2 = Constant(name: "2", value: 2)
    let ab2 = Multiplication(left: const2, right: Multiplication(left: a, right: b))
    let b2 = Squared(enclosed: b)
    return Subtraction(left: Addition(left: a2, right: b2), right: ab2)
}
