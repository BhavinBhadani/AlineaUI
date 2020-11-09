
import UIKit

class CategoryTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private var containerShadowView: ShadowView = {
        let container = ShadowView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.shadowRadius = 4
        container.shadowOpacity = 0.2
        container.shadowOffset = CGSize(width: 0, height: 3)
        container.cornerRadius = 50
        return container
    }()

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var category: Category? {
        didSet {
            guard let c = category else { return }
            categoryImageView.image = UIImage(named: c.imageLink)
            categoryLabel.text = c.title
            containerContentView.backgroundColor = UIColor(named: c.backgroundColor) ?? ATColor.alineaLavender
        }
    }
}

// MARK: - Helpers
extension CategoryTableViewCell {
    private func setupView() {
        addSubview(containerShadowView)
        addSubview(containerContentView)
        
        containerShadowView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        containerShadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        containerShadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        containerShadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        containerContentView.topAnchor.constraint(equalTo: containerShadowView.topAnchor, constant: 0).isActive = true
        containerContentView.leadingAnchor.constraint(equalTo: containerShadowView.leadingAnchor, constant: 0).isActive = true
        containerContentView.trailingAnchor.constraint(equalTo: containerShadowView.trailingAnchor, constant: 0).isActive = true
        containerContentView.bottomAnchor.constraint(equalTo: containerShadowView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupStackView() {
        containerContentView.addSubview(stackView)
        stackView.addArrangedSubview(categoryImageView)
        stackView.addArrangedSubview(categoryLabel)

        stackView.leadingAnchor.constraint(equalTo: containerContentView.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerContentView.trailingAnchor, constant: -30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: containerContentView.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: containerContentView.centerYAnchor, constant: 0).isActive = true
        
        categoryImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
