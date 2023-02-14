import UIKit

class FooterView: UIView {
    lazy var sendApplication: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.normalStateButtonColor(), for: .normal)
        button.setTitle(.sendApplication, for: .normal)
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        button.backgroundColor = .activeStateButtonColor()
        button.contentEdgeInsets = .init(top: .normalInset,
                                         left: .defaultHeight,
                                         bottom: .normalInset,
                                         right: .defaultHeight)
        button.titleLabel?.font = .regular16
        return button
    }()
    
    private lazy var joinUs: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .regular14
        label.textColor = .baseTextColor()
        label.text = .joinUs
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = .bigInset
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        stackView.addArrangedSubview(joinUs)
        joinUs.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        stackView.addArrangedSubview(sendApplication)
        sendApplication.snp.makeConstraints {
            $0.height.equalTo(52)
        }
    }
    
    private func setupLayout() {
        
    }
}

