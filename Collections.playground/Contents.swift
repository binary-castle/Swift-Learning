

let fruits = ["Apple", "Banana", "Orange", "Grapes"]

let bananaAndOrange = fruits[1...2]

fruits.forEach {
    print($0)
}

print("Banana and orange")

bananaAndOrange.forEach { print($0) }

var dict = [
    "A": "B",
    "B": "C",
    "C": "D",
    "D": "E",
]

dict["E"] = "F"

dict = [
    "G": "H",
    "H": "I",
]

dict.forEach { key, value in
    print("\(key) maps to \(value)")
}

dict.keys.sorted().forEach {
    print("\($0) maps to \(dict[$0]!)")
}
