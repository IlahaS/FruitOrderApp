

import UIKit

extension UIImage {
    
    static var logoImage: UIImage { UIImage(named: "logo")! }
    static var bananaImage: UIImage {UIImage(named: "bananaImage")! }
    static var BascetBackground: UIImage {UIImage(named: "BascetBackground")! }
    static var bascetImage: UIImage {UIImage(named: "bascetImage")! }
    static var appleImage: UIImage {UIImage(named: "apl")! }
    static var cabbageBack1: UIImage {UIImage(named: "cabbageBackground1")! }
    static var cabbageBack2: UIImage {UIImage(named: "cabbageBackground2")! }
    static var cabbageImage: UIImage {UIImage(named: "apl")! }
    static var eggplantBack1: UIImage {UIImage(named: "eggplantBackground1")! }
    static var eggplantImage: UIImage {UIImage(named: "eggplantImage")! }
    static var eggplantBack2: UIImage {UIImage(named: "eggplantBackground2")! }
    static var bananaBackground1: UIImage {UIImage(named: "bananaBack1")! }
    static var bananaBack2: UIImage {UIImage(named: "bananaBackground2")! }
    static var lettuceBack1: UIImage {UIImage(named: "lettuceBackground1")! }
    static var lettuceBack2: UIImage {UIImage(named: "lettuceBackground2")! }
    static var lettuceImage: UIImage {UIImage(named: "lettuceImage")! }
    static var pottatoBack1: UIImage {UIImage(named: "pottatoBackground1")! }
    static var pottatoBack2: UIImage {UIImage(named: "pottatoBackground2")! }
    static var pottatoImage: UIImage {UIImage(named: "pottatoImage")! }
    static var tomattoBack1: UIImage {UIImage(named: "tomattoBackground1")! }
    static var tomattoBack2: UIImage {UIImage(named: "tomattoBackground2")! }
    static var tomattoImage: UIImage {UIImage(named: "tomattoImage")! }
    static var plus: UIImage {UIImage(named: "coolicon")! }
    static var trash1: UIImage {UIImage(named: "trash")! }
}

extension UIColor {
    convenience init(hexString: String) {
           let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
           var int = UInt64()
           Scanner(string: hex).scanHexInt64(&int)
           let a, r, g, b: UInt64
           switch hex.count {
           case 3: // RGB (12-bit)
               (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
           case 6: // RGB (24-bit)
               (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
           case 8: // ARGB (32-bit)
               (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
           default:
               (a, r, g, b) = (255, 0, 0, 0)
           }
           self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
       }
    
    static var yellowColor: UIColor { UIColor(hexString: "F2C94C") }
    static var purpleColor: UIColor { UIColor(hexString: "9059A7") }
    static var grayColor: UIColor { UIColor(hexString: "4F4F4F") }
    static var grayColor2: UIColor { UIColor(hexString: "E5E5E5") }
    static var greenColor: UIColor { UIColor(hexString: "6FCF97") }
    static var detailColor: UIColor { UIColor(hexString: "BDBDBD") }
}
