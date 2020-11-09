
import Foundation
import UIKit

extension UIFont {
    class func regularFont(_ size: CGFloat = 14) -> UIFont {
        return UIFont(name: ATFont.regular, size: size)!
    }
        
    class func boldFont(_ size: CGFloat = 14) -> UIFont {
        return UIFont(name: ATFont.bold, size: size)!
    }
    
    class func mediumFont(_ size: CGFloat = 14) -> UIFont {
        return UIFont(name: ATFont.medium, size: size)!
    }
}
