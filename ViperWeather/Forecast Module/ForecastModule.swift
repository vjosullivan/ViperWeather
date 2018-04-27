import UIKit

struct ForecastModule {

    static func assembled() -> UIViewController {
        let storyboard     = UIStoryboard(name: "Forecast", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ForecastViewController") as! ForecastViewController
        let presenter      = ForecastPresenter()
        let interactor     = ForecastInteractor()
        let router         = ForecastRouter()

        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.viewController = viewController
        presenter.router = router

        viewController.presenter = presenter

        router.viewController = viewController

        return UINavigationController(rootViewController: viewController)
    }
}
