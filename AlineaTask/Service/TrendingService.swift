
import Foundation

protocol TrendingServiceProtocol {
    func fetchTrending(complete: @escaping (_ success: Bool, _ themes: [Trending],_ error: APIError? ) -> ())
}

class TrendingService: TrendingServiceProtocol {
    func fetchTrending(complete: @escaping (_ success: Bool, _ themes: [Trending], _ error: APIError? ) -> ()) {
        DispatchQueue.global().async {
            let path = Bundle.main.path(forResource: "trending", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let trendings = try! decoder.decode(Trendings.self, from: data)
            complete(true, trendings.trendings, nil)
        }
    }
}
