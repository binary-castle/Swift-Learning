import Foundation

@resultBuilder
public struct HtmlBuilder {
    public static func buildExpression(_ element: HtmlNode) -> [HtmlNode] {
        return [element]
    }
    
    public static func buildBlock(_ elements: [HtmlNode]...) -> [HtmlNode] {
        return Array(elements.joined())
    }
    
    public static func buildOptional(_ element: [HtmlNode]?) -> [HtmlNode] {
        if let element {
            return element
        } else {
            return []
        }
    }
    
    public static func buildEither(first element: [HtmlNode]) -> [HtmlNode] {
        return element
    }
    
    public static func buildEither(second element: [HtmlNode]) -> [HtmlNode] {
        return element
    }
    
    public static func buildArray(_ elements: [[HtmlNode]]...) -> [HtmlNode] {
        return Array(elements.joined().joined())
    }
}
