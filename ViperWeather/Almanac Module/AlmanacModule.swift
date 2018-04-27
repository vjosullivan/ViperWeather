import UIKit

struct AlmanacModule {

    static func assembled() -> UIViewController {
        let storyboard     = UIStoryboard(name: "Almanac", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AlmanacViewController") as! AlmanacViewController
        let presenter      = AlmanacPresenter()
        let interactor     = AlmanacInteractor()
        let router         = AlmanacRouter()

        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.viewController = viewController
        presenter.router = router

        viewController.presenter = presenter

        router.viewController = viewController

        return viewController
    }
}
