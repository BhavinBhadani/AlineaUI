
import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private var containerContentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.radius = 50
        return container
    }()
    
    private var categoryImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldFont(21)
        return label
    }()

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()

}
