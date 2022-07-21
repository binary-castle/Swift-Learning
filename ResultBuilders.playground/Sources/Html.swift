import Foundation

// A protocol that defines an HTML element.
public protocol HtmlNode {
    // This function should return a valid HTML snippet
    func render() -> String
}

// A protocol that represent a regular HTML element with tags, attributes and children
public protocol HtmlElement : HtmlNode {
    static var tag: String { get }
    var children: [HtmlNode] { get }
}

// A generic function to render a HTML tag
func renderHtml(
    name: String,
    attributes: [String: String]?,
    children: [HtmlNode]
) -> String {
    var result = "<\(name)"
    var encodedAttributes = ""
    if let attributes {
        for (key, value) in attributes {
            encodedAttributes += "\(key)=\(value)"
        }
    }
    if !encodedAttributes.isEmpty {
        result += " \(encodedAttributes)"
    }
    if children.isEmpty {
        result += "/>"
    } else {
        result += ">"
        children.forEach {
            result += $0.render()
        }
        result += "</\(name)>"
    }
    return result
}

// Strings are valid elements in HTML element tree.
extension String : HtmlNode {
    public func render() -> String {
        return self
    }
}
// A default implementation of render function
extension HtmlElement {
    public func render() -> String {
        return renderHtml(name: Self.tag, attributes: nil, children: self.children)
    }
}

// The <html> tag
public struct Html : HtmlElement {
    public static let tag = "html"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}

// The <head> tag
public struct Head : HtmlElement {
    public static let tag = "head"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}

// The <title> tag
public struct Title : HtmlElement {
    public static let tag = "title"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}

// The <body> tag
public struct Body : HtmlElement {
    public static let tag = "body"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}

// The <h1> tag
public struct Heading1 : HtmlElement {
    public static let tag = "h1"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}

// The <p> tag
public struct Paragraph : HtmlElement {
    public static let tag = "p"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}
// Span
public struct Span : HtmlElement {
    public static let tag = "span"
    public let children: [HtmlNode]
    
    public init(@HtmlBuilder builder: () -> [HtmlNode]) {
        self.children = builder()
    }
}
