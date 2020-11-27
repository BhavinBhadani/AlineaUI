
import UIKit

class PagerTabViewController: UIViewController {
    enum SegmentTab {
        case category, themes, trending
    }
    fileprivate let pages: [SegmentTab] = [.category, .themes, .trending]
    
    private let buttonSegment: ButtonSegmentView = {
        let segmentView = ButtonSegmentView(frame: .zero, buttonTitles: ["Category", "Themes", "Trending"])
        segmentView.selectorViewColor = ATColor.alineaBlue ?? .blue
        segmentView.selectorTextColor = ATColor.alineaBlue ?? .blue
        segmentView.textColor = ATColor.alineaGrey ?? .gray
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        return segmentView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.allowsSelection = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryPagerCell.self, forCellWithReuseIdentifier: CategoryPagerCell.identifier)
        collectionView.register(ThemesPagerCell.self, forCellWithReuseIdentifier: ThemesPagerCell.identifier)
        collectionView.register(TrendingPagerCell.self, forCellWithReuseIdentifier: TrendingPagerCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: Helpers
extension PagerTabViewController {
    private func setupView() {
        let titleLabel = UILabel()
        titleLabel.text = "Explore"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldFont(21)
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel

        view.addSubview(buttonSegment)
        buttonSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        buttonSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        buttonSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        buttonSegment.heightAnchor.constraint(equalToConstant: 50) .isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: buttonSegment.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: UICollectionView Datasource & Delegates
extension PagerTabViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentTab = pages[indexPath.row]
        switch currentTab {
        case .category:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryPagerCell.identifier,
                                                                for: indexPath) as? CategoryPagerCell else {
                fatalError("UICollectionView must be downcasted to CategoryPagerCell")
            }
            return cell
            
        case .themes:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemesPagerCell.identifier,
                                                                for: indexPath) as? ThemesPagerCell else {
                fatalError("UICollectionView must be downcasted to ThemesPagerCell")
            }
            return cell
            
        case .trending:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingPagerCell.identifier,
                                                                for: indexPath) as? TrendingPagerCell else {
                fatalError("UICollectionView must be downcasted to TrendingPagerCell")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: collectionView.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x / CGFloat(pages.count)
        buttonSegment.selectorView.transform = CGAffineTransform(translationX: offset, y: 0)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let item = Int(scrollView.contentOffset.x / view.frame.width)
        let indexPath = IndexPath(item: item, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let item = Int(x / view.frame.width)
        let indexPath = IndexPath(item: item, section: 0)
        buttonSegment.setIndex(index: indexPath.row)
    }
}
