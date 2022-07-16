import Foundation

// With subscript, you can make a class or struct capable of handling [] operator

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return 0..<self.rows ~= row && 0..<self.columns ~= column
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            // ⚠️⚠️⚠️
            // Alert! The getter of subscript cannot be able to mutate the struct, even if
            // var keyword is used for fields or the instance itself. In other words,
            // self in getter is IMMUTABLE. This condition is relaxed for classes,
            // since it doesn't have implicit immutability.
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

print("#1 Matrix is now \(matrix.grid)")
matrix[0,0] = 1
print("#2 Matrix is now \(matrix.grid)")
matrix[0,1] = 2
print("#3 Matrix is now \(matrix.grid)")
matrix[1,0] = 3
print("#4 Matrix is now \(matrix.grid)")
matrix[1,1] = 4
print("#5 Matrix is now \(matrix.grid)")

for i in 0..<matrix.rows {
    for j in 0..<matrix.columns {
        print("Element at (\(i), \(j)) is \(matrix[i,j])")
    }
}
