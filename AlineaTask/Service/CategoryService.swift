
import Foundation

protocol CategoryServiceProtocol {
    func fetchCategories(complete: @escaping (_ success: Bool, _ categories: [Category],_ error: APIError? ) -> ())
}

class CategoryService: CategoryServiceProtocol {
    func fetchCategories(complete: @escaping (_ success: Bool, _ categories: [Category], _ error: APIError? ) -> ()) {
        DispatchQueue.global().async {
            let path = Bundle.main.path(forResource: "categories", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let categories = try! decoder.decode(Categories.self, from: data)
            complete(true, categories.categories, nil)
        }
    }
}
