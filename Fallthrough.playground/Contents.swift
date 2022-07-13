import Foundation

// MARK: "fallthrough" keyword is not that what you think!
// It executes the cases after the first matching case
// until it reaches a case without a "fallthrough" statement!

func printFactsAbout(_ value: Int) {
    switch value {
    case 51...:
        print("➡️ \(value) greater than 50")
        fallthrough
    case 41...50:
        print("➡️ \(value) greater than 40")
        fallthrough
    case 31...40:
        print("➡️ \(value) greater than 30")
        fallthrough
    case 21...30:
        print("➡️ \(value) greater than 20")
        fallthrough
    case 11...20:
        print("➡️ \(value) greater than 10")
        fallthrough
    case 1...10:
        print("➡️ \(value) greater than 0")
    case 0:
        print("➡️ \(value) is zero")
    default:
        print("➡️ \(value) is a negative number")
    }
}

let testValues = [-5, 0, 2, 10, 13, 21, 34, 45, 56]

testValues.forEach { value in
    print("\nFacts about \(value)\n")
    printFactsAbout(value)
}
