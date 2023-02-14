import UIKit
import PanModal

protocol ContentDelegate: AnyObject {
    func didTapAction()
}

class ContentViewController: UIViewController {
    weak var delegate: ContentDelegate?
    
    private var isShortFormEnabled = true
    
    private let headerView = HeaderView(titleLabelText: .title, subtitleLabelText: .info)
    private let plusInformationView = InfvoView(infoLabelText: .scholarship)
    private let loopedHCollection = LoopedHCollection(data: Tags.allTags)
    private let tagsView = TagsViewController()
    private let footerView = FooterView()
    
    init(delegate: ContentDelegate? = nil) {
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.addSubview(headerView)
        view.addSubview(plusInformationView)
        
        view.addSubview(loopedHCollection.view)
        addChild(loopedHCollection)
        loopedHCollection.didMove(toParent: self)
        
        view.addSubview(tagsView.view)
        addChild(tagsView)
        tagsView.didMove(toParent: self)
        
        view.addSubview(footerView)
        
        footerView.sendApplication.addTarget(self, action: #selector(didTapSendApplictionButton), for: .touchUpInside)
    }
    
    private func setupLayout() {
        headerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(CGFloat.normalInset)
            $0.top.equalToSuperview().inset(CGFloat.bigCornerRadius)
        }
        
        plusInformationView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(CGFloat.normalInset)
            $0.top.equalTo(loopedHCollection.view.snp.bottom).offset(CGFloat.bigInset)
        }
        
        loopedHCollection.view.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(CGFloat.cornerRadius)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(CGFloat.defaultHeight)
        }
        
        tagsView.view.snp.makeConstraints {
            $0.top.equalTo(plusInformationView.snp.bottom).offset(CGFloat.cornerRadius)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.normalInset)
        }
        
        footerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(CGFloat.normalInset)
            $0.bottom.equalToSuperview().inset(view.frame.height - 510 - topOffset)
        }
        
        view.backgroundColor = .white
    }
    
    @objc private func didTapSendApplictionButton() {
        delegate?.didTapAction()
    }
    
}

// MARK: - Pan Modal Presentable

extension ContentViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return isShortFormEnabled ? .contentHeight(510) : longFormHeight
    }
    
    var scrollIndicatorInsets: UIEdgeInsets {
        let bottomOffset = presentingViewController?.bottomLayoutGuide.length ?? 0
        return UIEdgeInsets(top: headerView.frame.size.height, left: 0, bottom: bottomOffset, right: 0)
    }
    
    var anchorModalToLongForm: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return false
    }
    
    var panModalBackgroundColor: UIColor {
        return .clear
    }
    
    var cornerRadius: CGFloat {
        return .bigCornerRadius
    }
    
    var allowsExtendedPanScrolling: Bool {
        return true
    }
    
    func willTransition(to state: PanModalPresentationController.PresentationState) {
        guard isShortFormEnabled, case .longForm = state
        else { return }
        
        UIView.animate(withDuration: 1.5, delay: 0.5) { [weak self] in
            self?.footerView.snp.updateConstraints {
                $0.bottom.equalToSuperview().inset(58)
            }
        }
        
        isShortFormEnabled = false
        panModalSetNeedsLayoutUpdate()
    }
}
