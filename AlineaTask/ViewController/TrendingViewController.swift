
import UIKit

class TrendingViewController: UIViewController, IndicatorInfoProvider {
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: TrendingTableViewCell.identifier)
        tableView.register(TrendingSectionView.self, forHeaderFooterViewReuseIdentifier:TrendingSectionView.identifier)
        tableView.rowHeight = 80
        tableView.tableFooterView = nil
        tableView.backgroundColor = .white
        return tableView
    }()

    var itemInfo = IndicatorInfo(title: "")

    let dataSource = TrendingDataSource()
    
    lazy var viewModel : TrendingViewModel = {
        let viewModel = TrendingViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.observe(on: self) { [weak self] stocks in
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
        
        viewModel.fetchTrendings()

    }
}

// MARK: Helpers
extension TrendingViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.delegate = self
    }
}

// MARK: IndicatorInfoProvider
extension TrendingViewController {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

// MARK: Tableview delegates
extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TrendingSectionView.identifier) as? TrendingSectionView else {
            return nil
        }

        view.backgroundColor = .white
        view.setSectionTitle(with: section == 0 ? "Top Gainers" : "Top Sellers")
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
