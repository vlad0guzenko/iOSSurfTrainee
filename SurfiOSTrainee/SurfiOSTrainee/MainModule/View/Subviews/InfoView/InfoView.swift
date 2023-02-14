import UIKit

class InfvoView: UIStackView {
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .baseTextColor()
        label.font = .regular14
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    init(infoLabelText: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fill
        alignment = .fill

        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        addArrangedSubview(infoLabel)

        spacing = .cornerRadius
        infoLabel.text = infoLabelText
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
