import UIKit

final class TagButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentEdgeInsets = .init(top: .cornerRadius,
                                  left: .bigInset,
                                  bottom: .cornerRadius,
                                  right: .bigInset)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        titleLabel?.font = .regular14
        clipsToBounds = true
        backgroundColor = .normalStateButtonColor()
        setTitleColor(.activeStateButtonColor(), for: .normal)
    }
}
