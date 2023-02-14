import UIKit

class MainModuleAssembly {

    static func assemble() -> UIViewController {
        let view = MainModuleViewController()
        let router = MainModuleRouter(view: view)
        let presenter = MainModulePresenter()
        let interactor = MainModuleInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view

        return view
    }

}
