import UIKit

final class TagViewCell: UICollectionViewCell {
    let tagButton: TagButton = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayout()
        
        tagButton.addTarget(self, action: #selector(didTapTag), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.addSubview(tagButton)
        tagButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func setupViews() {
        layer.cornerRadius = .cornerRadius
        layer.masksToBounds = true
        backgroundColor = tagButton.backgroundColor
        
        tagButton.setupView()
    }
    
    @objc func didTapTag() {
        tagButton.isSelected.toggle()
        
        let background = tagButton.isSelected ? UIColor.activeStateButtonColor() : UIColor.normalStateButtonColor()

        backgroundColor = background
        tagButton.backgroundColor = background
        
        tagButton.setTitleColor(.normalStateButtonColor(), for: .selected)
        tagButton.setTitleColor(.activeStateButtonColor(), for: .normal)
    }
}
