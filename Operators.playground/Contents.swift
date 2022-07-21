import Foundation

print("-- Defining Constants")
let a: some Expression = Constant(name: "a", value: 2)
let b: some Expression = Constant(name: "b", value: 4)
let c: some Expression = Constant(name: "c", value: 5)
print(a.prettyPrint())
print(b.prettyPrint())
print(c.prettyPrint())

print("\n-- Computation by building expression nodes")
let sum0 = Addition(left: a, right: b)
let sum1 = Addition(left: Addition(left: a, right: b), right: c)
let sum2 = Addition(left: a, right: Addition(left: b, right: c))
print(sum0.prettyPrint())
print(sum1.prettyPrint())
print(sum2.prettyPrint())

print("\n-- Computation by using operators")
let sum3 = sum0 + c + 2
let computation1 = (a + b)^^c
let computation2 = (a + b)^^(c + 2)
print(sum3.prettyPrint())
print(computation1.prettyPrint())
print(computation2.prettyPrint())

print("\n-- Proving a well-known polynomial identity")
let lhs = (a + b)^^2
let rhs = a^^2 + 2 * a * b + b^^2
print(lhs.prettyPrint())
print(rhs.prettyPrint())
