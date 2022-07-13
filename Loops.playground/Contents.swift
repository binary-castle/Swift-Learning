import Foundation

let fruits = ["Apple", "Banana", "Orange", "Grapes"]

print("Loop using for in")

for fruit in fruits {
    print(fruit)
}

print("Loop using indexed for loop")

for index in 0 ..< fruits.count {
    print("Index: \(index) Fruit: \(fruits[index])")
}

print("Loop using .indices")

for index in fruits.indices {
    print("Index: \(index) Fruit: \(fruits[index])")
}

print("Loop using forEach")

fruits.forEach { fruit in
    print(fruit)
}

print("Loop using while")

var currentIndex = 0

while (currentIndex < fruits.count) {
    print("Index: \(currentIndex) Fruit: \(fruits[currentIndex])")
    currentIndex += 1
}

print("Loop using repeat {} while")

currentIndex = 0

repeat {
    print("Index: \(currentIndex) Fruit: \(fruits[currentIndex])")
    currentIndex += 1
} while(currentIndex < fruits.count)

print("Switch case")

fruits.forEach { fruit in
    switch (fruit) {
    case "Apple": print("🍎")
    case "Banana": print("🍌")
    case "Orange": print("🍊")
    default: print("A fruit named \(fruit)")
    }
}
