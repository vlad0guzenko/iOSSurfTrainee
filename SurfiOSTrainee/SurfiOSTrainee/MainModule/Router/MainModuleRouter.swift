import UIKit

class MainModuleRouter: MainModuleRouterInput {
    var view: MainModuleViewController
    
    var content: ContentViewController?
    
    init(view: MainModuleViewController) {
        self.view = view
    }

    func showPanModule() {
        let delegate = view.presenter as? ContentDelegate
        let content = ContentViewController(delegate: delegate)
        self.content = content
        
        view.presentPanModal(content)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: .congratulation, message: .sendApplication, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: .close, style: UIAlertAction.Style.default, handler: nil))
        content?.present(alert, animated: true, completion: nil)
    }
}
