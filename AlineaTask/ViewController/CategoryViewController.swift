
import UIKit

class CategoryViewController: UIViewController {
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.rowHeight = 120
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.contentInset.top = 10
        return tableView
    }()

    let dataSource = CategoryDataSource()
    
    lazy var viewModel : CategoryViewModel = {
        let viewModel = CategoryViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.observe(on: self) { [weak self] categories in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
        
        viewModel.fetchCategories()
    }
}

// MARK: Helpers
extension CategoryViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
