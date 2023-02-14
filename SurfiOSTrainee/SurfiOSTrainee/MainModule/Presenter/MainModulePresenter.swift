class MainModulePresenter: MainModuleViewOutput, MainModuleInteractorOutput {

    weak var view: MainModuleViewInput?
    var interactor: MainModuleInteractorInput?
    var router: MainModuleRouterInput?

    func viewIsReady() {}
}

extension MainModulePresenter: MainModulePresenterInput {
    func presentPanModule() {
        router?.showPanModule()
    }
    
    private func languageChanged() {
        view?.updateTexts()
    }
}

extension MainModulePresenter: ContentDelegate {
    func didTapAction() {
        router?.showAlert()
    }
}
