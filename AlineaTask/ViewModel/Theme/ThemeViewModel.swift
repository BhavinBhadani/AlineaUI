
import Foundation
import UIKit

struct ThemeViewModel {
    weak var dataSource : GenericDataSource<Theme>?
    var onErrorHandling : ((APIError?) -> Void)?
    
    init(dataSource : GenericDataSource<Theme>?) {
        self.dataSource = dataSource
    }
    
    func fetchThemes() {
        ThemeService().fetchThemes { (success, categories, error) in
            if success {
                self.dataSource?.data.value = categories
            } else {
                self.onErrorHandling?(error)
            }
        }
    }
}
