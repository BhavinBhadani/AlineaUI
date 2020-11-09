
import Foundation

struct Trendings: Decodable {
    let trendings: [Trending]
}

struct Trending: Decodable {
    let title: String
    let category: String
    let imageLink: String
    let movement: Float
    
    init(title: String, category: String, link: String, movement: Float) {
        self.title = title
        self.category = category
        self.imageLink = link
        self.movement = movement
    }
}
