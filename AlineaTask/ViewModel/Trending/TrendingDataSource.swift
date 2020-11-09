
import Foundation
import UIKit

class TrendingDataSource : GenericDataSource<Trending>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.value.filter { $0.movement >= 0 }.count
        }
        return data.value.filter { $0.movement < 0 }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.identifier,
                                                       for: indexPath) as? TrendingTableViewCell else {
            fatalError("UITableViewCell must be downcasted to TrendingTableViewCell")
        }
        
        if indexPath.section == 0 {
            let gainers = data.value.filter { $0.movement >= 0 }
            cell.trending = gainers[indexPath.row]

        } else {
            let loosers = data.value.filter { $0.movement < 0 }
            cell.trending = loosers[indexPath.row]
        }

        return cell
    }
}
