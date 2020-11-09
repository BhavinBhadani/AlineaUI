
import Foundation

protocol ThemeServiceProtocol {
    func fetchThemes(complete: @escaping (_ success: Bool, _ themes: [Theme],_ error: APIError? ) -> ())
}

class ThemeService: ThemeServiceProtocol {
    func fetchThemes(complete: @escaping (_ success: Bool, _ themes: [Theme], _ error: APIError? ) -> ()) {
        DispatchQueue.global().async {
            let path = Bundle.main.path(forResource: "themes", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let themes = try! decoder.decode(Themes.self, from: data)
            complete(true, themes.themes, nil)
        }
    }
}
