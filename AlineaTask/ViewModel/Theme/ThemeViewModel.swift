
import Foundation
import UIKit

struct ThemeViewModel {
    weak var dataSource : GenericDataSource<Theme>?
    var onErrorHandling : ((APIError?) -> Void)?
    
    init(dataSource : GenericDataSource<Theme>?) {
        self.dataSource = dataSource
    }
    
    func fetchThemes() {
        ThemeService().fetchThemes { result in
            switch result {
            case .success(let themes):
                self.dataSource?.data.value = themes
            case .failure(let e):
                self.onErrorHandling?(e)
            }
        }
    }
}
