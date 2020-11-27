
import Foundation
import UIKit

struct CategoryViewModel {
    weak var dataSource : GenericDataSource<Category>?
    var onErrorHandling : ((APIError?) -> Void)?
    
    init(dataSource : GenericDataSource<Category>?) {
        self.dataSource = dataSource
    }
    
    func fetchCategories() {
        CategoryService().fetchCategories { result in
            switch result {
            case .success(let categories):
                self.dataSource?.data.value = categories
            case .failure(let e):
                self.onErrorHandling?(e)
            }
        }
    }
}
