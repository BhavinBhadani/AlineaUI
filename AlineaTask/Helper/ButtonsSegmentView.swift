
import UIKit

protocol ButtonSegmentViewDelegate: class {
    func change(to index:Int)
}

class ButtonSegmentView: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var selectorView: UIView!
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
    
    weak var delegate: ButtonSegmentViewDelegate?
    
    public private(set) var selectedIndex : Int = 0
        
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.backgroundColor = .white
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setIndex(index: Int) {
        let button = buttons[index]
        selectedIndex = index
        buttons.forEach { btn in
            btn.setTitleColor(btn == button ? selectorTextColor : textColor, for: .normal)
        }
        
//        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
//        UIView.animate(withDuration: 0.2) {
//            self.selectorView.frame.origin.x = selectorPosition
//        }
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}

//Configuration View
extension ButtonSegmentView {
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height - 2, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = []
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(ButtonSegmentView.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}
