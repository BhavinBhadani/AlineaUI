
import UIKit

class TrendingTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private var containerContentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        return container
    }()

    private var companyImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ATColor.alineaBlack
        label.font = .boldFont(15)
        return label
    }()

    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ATColor.alineaLightGrey
        label.font = .mediumFont(15)
        return label
    }()

    private var movementContentView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 12
        container.layer.masksToBounds = true
        return container
    }()

    private var movementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .mediumFont(12)
        label.textAlignment = .center
        return label
    }()

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 4
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupView()
        setupMovementView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var trending: Trending? {
        didSet {
            guard let t = trending else { return }
            companyImageView.image = UIImage(named: t.imageLink)
            companyLabel.text = t.title
            categoryLabel.text = t.category
            movementContentView.backgroundColor = t.movement > 0 ? ATColor.alineaBottleGreen : ATColor.alineaRed
            movementLabel.text = t.movement > 0 ? "+\(t.movement)%" : "\(t.movement)%"
        }
    }
}

// MARK: - Helpers
extension TrendingTableViewCell {
    private func setupView() {
        addSubview(containerContentView)
        
        containerContentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        containerContentView.addSubview(companyImageView)
        companyImageView.leadingAnchor.constraint(equalTo: containerContentView.leadingAnchor, constant: 25).isActive = true
        companyImageView.centerYAnchor.constraint(equalTo: containerContentView.centerYAnchor, constant: 0).isActive = true
        companyImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        companyImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupMovementView() {
        addSubview(movementContentView)
        movementContentView.trailingAnchor.constraint(equalTo: containerContentView.trailingAnchor, constant: -25).isActive = true
        movementContentView.centerYAnchor.constraint(equalTo: containerContentView.centerYAnchor, constant: 0).isActive = true
        movementContentView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        movementContentView.widthAnchor.constraint(equalToConstant: 80).isActive = true

        movementContentView.addSubview(movementLabel)
        movementLabel.leadingAnchor.constraint(equalTo: movementContentView.leadingAnchor, constant: 10).isActive = true
        movementLabel.trailingAnchor.constraint(equalTo: movementContentView.trailingAnchor, constant: -10).isActive = true
        movementLabel.topAnchor.constraint(equalTo: movementContentView.topAnchor, constant: 0).isActive = true
        movementLabel.bottomAnchor.constraint(equalTo: movementContentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupStackView() {
        containerContentView.addSubview(stackView)
        stackView.addArrangedSubview(companyLabel)
        stackView.addArrangedSubview(categoryLabel)

        stackView.leadingAnchor.constraint(equalTo: companyImageView.trailingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: movementContentView.leadingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: containerContentView.centerYAnchor, constant: 0).isActive = true
    }
}
