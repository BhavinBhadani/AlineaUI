
import UIKit

class PagerTabCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private var tabTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldFont()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setLabel() {
        addSubview(tabTitle)
        tabTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        tabTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        tabTitle.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 8).isActive = true
        tabTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
    }

    func setTabTitle(_ title: String) {
        tabTitle.text = title
    }
}
