
import Foundation
import UIKit

struct TrendingViewModel {
    weak var dataSource : GenericDataSource<Trending>?
    var onErrorHandling : ((APIError?) -> Void)?

    init(dataSource : GenericDataSource<Trending>?) {
        self.dataSource = dataSource
    }

    func fetchTrendings() {
        TrendingService().fetchTrending { result in
            switch result {
            case .success(let stocks):
                self.dataSource?.data.value = stocks
            case .failure(let e):
                self.onErrorHandling?(e)
            }
        }
    }
}
