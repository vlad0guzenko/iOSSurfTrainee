import UIKit

final class TagCollectionView: UICollectionView {
    init(_ layout: TagCollectionViewFlowLayout = .init()) {
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let width = contentSize.width +
        contentInset.left +
        contentInset.right
        
        let height = contentSize.height +
        contentInset.top +
        contentInset.bottom
        
        return .init(width: width,height: height)
    }
}
