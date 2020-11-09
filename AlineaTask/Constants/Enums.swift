
import Foundation
import UIKit

enum ATColor {
    static let alineaBlack              = UIColor(named: "AlineaBlack")
    static let alineaBlue               = UIColor(named: "AlineaBlue")
    static let alineaBottleGreen        = UIColor(named: "AlineaBottleGreen")
    static let alineaGrey               = UIColor(named: "AlineaGrey")
    static let alineaGrey1              = UIColor(named: "AlineaGrey1")
    static let alineaGrey2              = UIColor(named: "AlineaGrey2")
    static let alineaLavender           = UIColor(named: "AlineaLavender")
    static let alineaLightGrey          = UIColor(named: "AlineaLightGrey")
    static let alineaRed                = UIColor(named: "AlineaRed")
    static let alineaYellow             = UIColor(named: "AlineaYellow")
}

enum ATFont {
    static let regular                  = "AvenirNext-Regular"
    static let medium                   = "AvenirNext-Medium"
    static let bold                     = "AvenirNext-Bold"
}

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}
