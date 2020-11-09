
import UIKit

class CategoryViewController: UIViewController, IndicatorInfoProvider {

    var itemInfo = IndicatorInfo(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IndicatorInfoProvider
extension CategoryViewController {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
