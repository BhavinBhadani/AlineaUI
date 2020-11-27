
import Foundation

protocol ThemeServiceProtocol {
    func fetchThemes(completion: @escaping (Result<[Theme], APIError>) -> ())
}

class ThemeService: ThemeServiceProtocol {
    func fetchThemes(completion: @escaping (Result<[Theme], APIError>) -> ()) {
        DispatchQueue.global().async {
            guard let path = Bundle.main.path(forResource: "themes", ofType: "json") else {
                completion(.failure(APIError.invalidFilePath))
                return
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let themes = try decoder.decode(Themes.self, from: data)
                completion(.success(themes.themes))
            } catch let error {
                print("Fetch themes Error: \(error.localizedDescription)")
                completion(.failure(APIError.unableToParseData))
            }
        }
    }
}
