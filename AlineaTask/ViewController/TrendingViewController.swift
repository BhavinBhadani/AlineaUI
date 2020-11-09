
import UIKit

class TrendingViewController: UIViewController, IndicatorInfoProvider {
    
    var itemInfo = IndicatorInfo(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IndicatorInfoProvider
extension TrendingViewController {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
