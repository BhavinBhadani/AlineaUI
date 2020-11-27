
import UIKit

class ThemesViewController: UIViewController {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        return collectionView
    }()
        
    let dataSource = ThemeDataSource()
    
    lazy var viewModel : ThemeViewModel = {
        let viewModel = ThemeViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.collectionView.dataSource = self.dataSource
        self.dataSource.data.observe(on: self) { [weak self] themes in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        self.viewModel.onErrorHandling = { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let controller = UIAlertController(title: "An error occured",
                                                   message: error?.rawValue ?? "Oops, something went wrong!",
                                                   preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(controller, animated: true, completion: nil)
            }
        }
        
        viewModel.fetchThemes()
    }
}

// MARK: Helpers
extension ThemesViewController {
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.delegate = self
    }
}

// MARK: - CollectionView flow layout
extension ThemesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 20
        
        let totalSpacing = 50 + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
