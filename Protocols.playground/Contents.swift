import Foundation

// This is a protocol to represent symmetric geometric polygons

// A protocol can have
protocol SymmetricPolygon {
    // properties,
    var edges: Int { get }
    // methods,
    func computeEdgeLength(radius: Double) -> Double
    // static fields,
    static var name: String { get }
    // and even initializers!
    init()
}
// so that the conforming entity should implement the requirements by the protocol.

// Since we have a common method for computing edge length for
// every polygons, we provide a default implementation of computeEdgeLength
// method with an extension

extension SymmetricPolygon {
    func computeEdgeLength(radius: Double) -> Double {
        let halfAngleInRadians = Double.pi / Double(self.edges)
        return 2.0 * sin(halfAngleInRadians) * radius
    }
}

struct LineSegment: SymmetricPolygon {
    var edges: Int = 2
    static var name: String = "Line Segment"
    
    // Optionally, you can provide alternative implementation to the default
    // method declared in the extension
    
    func computeEdgeLength(radius: Double) -> Double {
        return 2.0 * radius
    }
}

// From triangle, we can use the default implementation of computeEdgeLength method
// which is already declared in the extension

struct SymmetricTriangle : SymmetricPolygon {
    var edges = 3
    static var name = "Symmetric Triangle"
}

struct Square : SymmetricPolygon {
    var edges = 4
    static var name = "Square"
}

struct SymmetricPentagon: SymmetricPolygon {
    var edges = 5
    static var name = "Symmetric Pentagon"
}

struct SymmetricHexagon: SymmetricPolygon {
    var edges = 6
    static var name = "Symmetric Hexagon"
}

let polygons: [SymmetricPolygon] = [
    LineSegment(),
    SymmetricTriangle(),
    Square(),
    SymmetricPentagon(),
    SymmetricHexagon()
]

let radius = 10.0

polygons.forEach { polygon in
    // You need to know the type to access the static property. Use type(of:) to get the runtime metatype.
    // A metatype type refers to the type of any type, including class types, structure types,
    // enumeration types, and protocol types.
    print("Polygon name: \(type(of: polygon).name)")
    print("- Polygon has \(polygon.edges) edges")
    print("- Edge Length = \(polygon.computeEdgeLength(radius: radius))")
}
