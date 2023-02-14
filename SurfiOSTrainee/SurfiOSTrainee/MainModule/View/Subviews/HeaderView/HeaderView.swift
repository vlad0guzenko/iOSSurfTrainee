import UIKit

class HeaderView: UIStackView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .bold24
        label.textColor = .activeStateButtonColor()
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .baseTextColor()
        label.font = .regular14
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    

    init(titleLabelText: String, subtitleLabelText: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fill
        alignment = .fill

        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        subtitleLabel.lineBreakMode = .byWordWrapping
        addArrangedSubview(titleLabel)
        addArrangedSubview(subtitleLabel)

        spacing = .cornerRadius
        
        titleLabel.text = titleLabelText
        subtitleLabel.text = subtitleLabelText
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
