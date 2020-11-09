
import Foundation
import UIKit

struct CategoryViewModel {
    weak var dataSource : GenericDataSource<Category>?
    var onErrorHandling : ((APIError?) -> Void)?
    
    init(dataSource : GenericDataSource<Category>?) {
        self.dataSource = dataSource
    }
    
    func fetchCategories() {
        CategoryService().fetchCategories { (success, categories, error) in
            if success {
                self.dataSource?.data.value = categories
            } else {
                self.onErrorHandling?(error)
            }
        }
    }
}
