
import Foundation

struct Themes: Decodable {
    let themes: [Theme]
}

struct Theme: Decodable {
    let title: String
    let imageLink: String

    init(title: String, link: String) {
        self.title = title
        self.imageLink = link
    }
}
