import Foundation
import UIKit

public extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
}

public extension UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
