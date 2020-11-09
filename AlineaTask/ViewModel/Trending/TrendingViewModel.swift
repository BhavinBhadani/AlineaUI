
import Foundation
import UIKit

struct TrendingViewModel {
    weak var dataSource : GenericDataSource<Trending>?
    var onErrorHandling : ((APIError?) -> Void)?

    init(dataSource : GenericDataSource<Trending>?) {
        self.dataSource = dataSource
    }

    func fetchTrendings() {
        TrendingService().fetchTrending { (success, stocks, error) in
            if success {
                self.dataSource?.data.value = stocks
            } else {
                self.onErrorHandling?(error)
            }
        }
    }
}
