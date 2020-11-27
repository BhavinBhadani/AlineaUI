
import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private var containerContentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = ATColor.alineaGrey1
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = true
        container.layer.borderWidth = 1
        container.layer.borderColor = ATColor.alineaGrey2?.cgColor
        return container
    }()
    
    private var themeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ATColor.alineaGrey
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .mediumFont()
        return label
    }()

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var theme: Theme? {
        didSet {
            guard let t = theme else { return }
            themeImageView.image = UIImage(named: t.imageLink)
            themeLabel.text = t.title
        }
    }
}

// MARK: - Helpers
extension ThemeCollectionViewCell {
    private func setupView() {
        addSubview(containerContentView)
        
        containerContentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupStackView() {
        containerContentView.addSubview(stackView)
        stackView.addArrangedSubview(themeImageView)
        stackView.addArrangedSubview(themeLabel)

        stackView.leadingAnchor.constraint(equalTo: containerContentView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerContentView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: containerContentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerContentView.bottomAnchor, constant: 0).isActive = true
        
        themeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
