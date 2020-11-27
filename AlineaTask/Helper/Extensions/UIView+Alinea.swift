
import UIKit

class ShadowView: UIView {
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
    
    public var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    public var shadowRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    public var shadowOffset: CGSize = .zero {
        didSet {
            update()
        }
    }
    
    public var shadowOpacity: Float = 0 {
        didSet {
            update()
        }
    }
    
    public var shadowColor: UIColor = .black {
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
