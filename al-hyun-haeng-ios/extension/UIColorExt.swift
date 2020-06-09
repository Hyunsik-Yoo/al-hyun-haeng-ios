import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    class var underlineGreen: UIColor {
        return UIColor(r: 82, g: 255, b: 32)
    }
}
