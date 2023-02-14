import UIKit

extension UIColor {
    private static func resourceColor(named: String,
                                      compatibleWith: UITraitCollection?) -> UIColor {
        guard let color = UIColor(named: named,
                                  in: .frameworkBundle,
                                  compatibleWith: compatibleWith) else {
            assertionFailure("Unable to find color named \(named) in \(Bundle.frameworkBundle)")
            return .clear
        }

        return color
    }
    
    /// #F3F3F5
    static func normalStateButtonColor(compatibleWith: UITraitCollection? = nil) -> UIColor {
        return resourceColor(named: "normal_state_button_color", compatibleWith: compatibleWith)
    }
    
    /// #313131
    static func activeStateButtonColor(compatibleWith: UITraitCollection? = nil) -> UIColor {
        return resourceColor(named: "active_state_button_color", compatibleWith: compatibleWith)
    }
    
    /// #96959B
    static func baseTextColor(compatibleWith: UITraitCollection? = nil) -> UIColor {
        return resourceColor(named: "base_text_color", compatibleWith: compatibleWith)
    }
}
