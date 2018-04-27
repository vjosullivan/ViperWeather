import UIKit

/// Router functions that can be called by the presenter.
protocol ForecastRouter_PresenterInterface {
    func displayForecastDetails(_ forecast: DarkSkyForecast)
    func displayAlmanac(_ forecast: DarkSkyForecast)
}

class ForecastRouter {

    weak var viewController: UIViewController?
}

extension ForecastRouter: ForecastRouter_PresenterInterface {

    func displayForecastDetails(_ forecast: DarkSkyForecast) {
        let detailsViewController = DetailsModule.assembled()
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }

    func displayAlmanac(_ forecast: DarkSkyForecast) {
        let almanacViewController = AlmanacModule.assembled()
        viewController?.navigationController?.pushViewController(almanacViewController, animated: true)
    }
}
