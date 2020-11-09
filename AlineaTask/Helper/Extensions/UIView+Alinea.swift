
import UIKit

extension UIView {
    @IBInspectable var radius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    func setShadow() {
        
    }
}

@IBDesignable class ShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override var frame: CGRect {
        didSet(oldFrame) {
            if oldFrame.size != frame.size {
                update()
            }
        }
    }
    
    override var bounds: CGRect {
        didSet {
            update()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        update()
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = .zero {
        didSet {
            update()
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = .black {
        didSet {
            update()
        }
    }
    
    private func setup() {
        backgroundColor = .clear
        isOpaque = true
        layer.shouldRasterize = true
    }
    
    private func update() {
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        self.layer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}
