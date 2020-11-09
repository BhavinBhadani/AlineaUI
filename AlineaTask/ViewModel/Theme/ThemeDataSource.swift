
import UIKit

class ThemeDataSource : GenericDataSource<Theme>, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.identifier,
                                                            for: indexPath) as? ThemeCollectionViewCell else {
            fatalError("UICollectionView must be downcasted to ThemeCollectionViewCell")
        }
        cell.theme = data.value[indexPath.row]
        return cell
    }
}
