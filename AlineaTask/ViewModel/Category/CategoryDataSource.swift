
import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: Observable<[T]> = Observable([])
}

class CategoryDataSource : GenericDataSource<Category>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier,
                                                       for: indexPath) as? CategoryTableViewCell else {
            fatalError("UITableViewCell must be downcasted to CategoryTableViewCell")
        }
        let category = self.data.value[indexPath.row]
        cell.category = category
        return cell
    }
}
