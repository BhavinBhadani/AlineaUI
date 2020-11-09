
import UIKit

class ThemesViewController: UIViewController, IndicatorInfoProvider {
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    var itemInfo = IndicatorInfo(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IndicatorInfoProvider
extension ThemesViewController {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
