
import Foundation

protocol CategoryServiceProtocol {
    func fetchCategories(completion: @escaping (Result<[Category], APIError>) -> ())
}

class CategoryService: CategoryServiceProtocol {
    func fetchCategories(completion: @escaping (Result<[Category], APIError>) -> ()) {
        DispatchQueue.global().async {
            guard let path = Bundle.main.path(forResource: "categories", ofType: "json") else {
                completion(.failure(APIError.invalidFilePath))
                return
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let categories = try decoder.decode(Categories.self, from: data)
                completion(.success(categories.categories))
            } catch let error {
                print("Fetch categories Error: \(error.localizedDescription)")
                completion(.failure(APIError.unableToParseData))
            }
        }
    }
}
