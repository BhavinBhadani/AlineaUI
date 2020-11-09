
import UIKit

class PagerTabViewController: ButtonBarPagerTabStripViewController {
    
    let containerScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topBarView: ButtonBarView = {
        let view = ButtonBarView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        setupPagerView()
        super.viewDidLoad()
        self.title = "Explore"
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let categoryViewController = CategoryViewController()
        categoryViewController.view.backgroundColor = .white
        categoryViewController.itemInfo = IndicatorInfo(title: "Category")
        
        let themesViewController = ThemesViewController()
        themesViewController.view.backgroundColor = .white
        themesViewController.itemInfo = IndicatorInfo(title: "Themes")
        
        let trendingViewController = TrendingViewController()
        trendingViewController.view.backgroundColor = .white
        trendingViewController.itemInfo = IndicatorInfo(title: "Trending")
        
        return [categoryViewController, themesViewController, trendingViewController]
    }
}

// MARK: - Helpers
extension PagerTabViewController {
    private func setupPagerView() {
        buttonBarView = topBarView
        containerView = containerScrollView
        
        view.addSubview(topBarView)
        view.addSubview(containerScrollView)
        
        /// consraints for topBarView
        topBarView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        /// consraints for containerScrollView
        containerScrollView.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 0).isActive = true
        containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        /// change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = ATColor.alineaBlue!
        settings.style.buttonBarItemFont = .mediumFont(17)
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = ATColor.alineaGrey!
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?,
                                           newCell: ButtonBarViewCell?,
                                           progressPercentage: CGFloat,
                                           changeCurrentIndex: Bool,
                                           animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = ATColor.alineaGrey
            newCell?.label.textColor = ATColor.alineaBlue
        }
    }
}
