
import Foundation

struct Categories: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let title: String
    let imageLink: String
    let backgroundColor: String
    
    init(title: String, link: String, backgroundColor: String) {
        self.title = title
        self.imageLink = link
        self.backgroundColor = backgroundColor
    }
}
