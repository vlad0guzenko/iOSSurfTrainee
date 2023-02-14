import UIKit

final class TagCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var isAutomaticItemSize: Bool {
        get {
            estimatedItemSize == UICollectionViewFlowLayout.automaticSize
        }
        set {
            estimatedItemSize = newValue ? UICollectionViewFlowLayout.automaticSize : .zero
        }
    }
    
    override init() {
        super.init()
        
        scrollDirection = .vertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard
            let attributes = super.layoutAttributesForElements(in: rect),
            let collectionView = collectionView
        else {
            return super.layoutAttributesForElements(in: rect)
        }
        
        var rows: [Row] = []
        var currentRowVerticalCenter: CGFloat = .zero
        
        attributes.forEach {
            if currentRowVerticalCenter != $0.frame.midY {
                currentRowVerticalCenter = $0.frame.midY
                rows.append(
                    Row(interItemSpacing: minimumInteritemSpacing)
                )
            }
            
            rows.last?.add(attribute: $0)
        }
        
        let collectionViewContentWidth = collectionView.bounds.width -
        collectionView.contentInset.left -
        collectionView.contentInset.right
        rows.forEach {
            $0.setupLayout(contentWidth: collectionViewContentWidth)
        }
        
        return rows.reduce(into: []) {
            $0 += $1.attributes
        }
    }
}

private final class Row {
        
    private let interItemSpacing: CGFloat
    private(set) var attributes: [UICollectionViewLayoutAttributes] = []
        
    private var rowWidth: CGFloat {
        let interItemsSpacing = CGFloat(attributes.count - 1) * interItemSpacing
        let rowItemsWidth = attributes.reduce(.zero) {
            $0 + $1.frame.width
        }
        
        return rowItemsWidth + interItemsSpacing
    }
    
    init(interItemSpacing: CGFloat) {
        self.interItemSpacing = interItemSpacing
    }
        
    func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }
    
    func setupLayout(contentWidth: CGFloat) {
        let padding: CGFloat = .zero
        var offset = padding
        attributes.forEach {
            $0.frame.origin.x = offset
            offset += $0.frame.width + interItemSpacing
        }
    }
}
