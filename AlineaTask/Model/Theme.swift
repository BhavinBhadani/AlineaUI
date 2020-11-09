
import Foundation

struct Theme: Decodable {
    let title: String
    let imageLink: String

    init(title: String, link: String) {
        self.title = title
        self.imageLink = link
    }
}
