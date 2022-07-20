import Foundation

let a = Constant(name: "A", value: 10)
let b = Constant(name: "B", value: 11)

a.prettyPrint()
b.prettyPrint()

let leftAddition = buildAdditionSquaredShortExpression(a: a, b: b)
let rightAddition = buildAdditionSquaredExpandedExpression(a: a, b: b )

leftAddition.prettyPrint()
rightAddition.prettyPrint()

let leftSubtraction = buildSubtractionSquaredShortExpression(a: a, b: b)
let rightSubtraction = buildSubtractionSquaredExpandedExpression(a: a, b: b )

leftSubtraction.prettyPrint()
rightSubtraction.prettyPrint()
