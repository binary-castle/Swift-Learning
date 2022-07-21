import Foundation

public protocol Expression {
    var name: String { get }
    var value: Double { get }
}

infix operator ^^ : MultiplicationPrecedence

public extension Expression {
    func prettyPrint() -> String {
        return "\(self.name) = \(self.value)"
    }
}

extension Double : Expression {
    public var name: String {
        get {
            return "\(self)"
        }
    }
    public var value: Double {
        get {
            return self
        }
    }
}

public func + <Left: Expression, Right: Expression>(left: Left, right: Right) -> some Expression {
    return Addition(left: left, right: right)
}

public func - (left: some Expression, right: some Expression) -> some Expression {
    return Subtraction(left: left, right: right)
}

public func * (left: some Expression, right: some Expression) -> some Expression {
    return Multiplication(left: left, right: right)
}

public func / (left: some Expression, right: some Expression) -> some Expression {
    return Division(left: left, right: right)
}

public func ^^ (left:some Expression, right: some Expression) -> some Expression {
    return Power(operand: left, power: right)
}

public struct Constant: Expression {
    public let name: String
    public let value: Double
    
    public init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
}

public struct Addition<Left: Expression, Right: Expression>: Expression {
    private let left: Left
    private let right: Right
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var name: String {
        get {
            return "(\(self.left.name) + \(self.right.name))"
        }
    }
    
    public var value: Double {
        get {
            return self.left.value + self.right.value
        }
    }
}

public struct Subtraction<Left: Expression, Right: Expression>: Expression {
    private let left: Left
    private let right: Right
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var name: String {
        get {
            return "(\(self.left.name) - \(self.right.name))"
        }
    }
    
    public var value: Double {
        get {
            return self.left.value - self.right.value
        }
    }
}

public struct Multiplication<Left: Expression, Right: Expression>: Expression {
    private let left: Left
    private let right: Right
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var name: String {
        get {
            return "(\(self.left.name) * \(self.right.name))"
        }
    }
    
    public var value: Double {
        get {
            return self.left.value * self.right.value
        }
    }
}

public struct Division<Left: Expression, Right: Expression>: Expression {
    private let left: Left
    private let right: Right
    
    public init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
    
    public var name: String {
        get {
            return "(\(self.left.name) / \(self.right.name))"
        }
    }
    
    public var value: Double {
        get {
            return self.left.value / self.right.value
        }
    }
}

public struct Power<Left: Expression, Right: Expression>: Expression {
    private let operand: Left
    private let power: Right
    
    public init(operand: Left, power: Right) {
        self.operand = operand
        self.power = power
    }
    
    public var name: String {
        get {
            if power is Constant || power is Double {
                switch (power.value) {
                case 2.0: return "(\(self.operand.name))²"
                case 3.0: return "(\(self.operand.name))³"
                default: return "(\(self.operand.name))^\(self.power.value)"
                }
            } else {
                return "(\(self.operand.name))^\(self.power.name)"
            }
        }
    }
    
    public var value: Double {
        get {
            return pow(self.operand.value, self.power.value)
        }
    }
}
