
import Foundation

protocol TrendingServiceProtocol {
    func fetchTrending(completion: @escaping (Result<[Trending], APIError>) -> ())
}

class TrendingService: TrendingServiceProtocol {
    func fetchTrending(completion: @escaping (Result<[Trending], APIError>) -> ()) {
        DispatchQueue.global().async {
            guard let path = Bundle.main.path(forResource: "trending", ofType: "json") else {
                completion(.failure(APIError.invalidFilePath))
                return
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let trendings = try decoder.decode(Trendings.self, from: data)
                completion(.success(trendings.trendings))
            } catch let error {
                print("Fetch trendings Error: \(error.localizedDescription)")
                completion(.failure(APIError.unableToParseData))
            }
        }
    }
}
