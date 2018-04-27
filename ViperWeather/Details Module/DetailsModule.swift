import UIKit

struct DetailsModule {

    static func assembled() -> UIViewController {
        let storyboard     = UIStoryboard(name: "Details", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let presenter      = DetailsPresenter()
        let interactor     = DetailsInteractor()
        let router         = DetailsRouter()

        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.viewController = viewController
        presenter.router = router

        viewController.presenter = presenter

        router.viewController = viewController

        return viewController
    }
}
