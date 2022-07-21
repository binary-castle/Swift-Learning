import Foundation

let document = Html {
    Head {
        Title {
            "Hello Swift!"
        }
    }
    Body {
        Heading1 {
            "Hello, Swift!"
        }
        Paragraph {
            "This is a HTML document rendered in Swift with @resultBuilder!"
        }
        for i in 1...3 {
            Paragraph {
                "This is paragraph \(i). "
                if i % 2 == 0 {
                    Span { "\(i) is an even number." }
                } else {
                    Span { "\(i) is an odd number." }
                }
            }
        }
    }
}

print(document.render())
