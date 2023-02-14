import UIKit
import SnapKit
import PanModal

class MainModuleViewController: UIViewController {
    var presenter: MainModulePresenterInput?
    var output: MainModuleViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        setupContentView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.presentPanModule()
    }
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .background
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    func addSubviews() {
        view.addSubview(backgroundView)
    }
    
    func makeConstraints() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setupContentView() {
        addSubviews()
        makeConstraints()
        updateTexts()
    }
}

extension MainModuleViewController: MainModuleViewInput {
    func setupInitialState() {
    }
    
    func updateTexts() {
    }
}
