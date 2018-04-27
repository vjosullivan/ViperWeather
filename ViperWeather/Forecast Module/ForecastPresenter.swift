import Foundation


/// Presenter functions that can be called by the view.
protocol ForecastPresenter_ViewControllerInterface: class {
    func updateForecast()
    func handleSwipeLeft()
    func handleSwipeRight()
}

/// Presenter functions that can be called by the interactor.
protocol ForecastPresenter_InteractorInterface: class {
    func fetchForecastSucceeded(_ forecast: DarkSkyForecast)
    func fetchForecastFailed(message: String)
}

/// Receives input from the view and reacts by either:
/// - Requesting data from the interactor, or
/// - Requesting that the router performs navigation.
///
/// Receives updates from the interactor and reats by:
/// - Updating the view.
class ForecastPresenter {

    // MARK: - Output protocols.

    weak var viewController:  ForecastViewController_PresenterInterface!
    var interactor: ForecastInteractor_PresenterInterface?
    var router:     ForecastRouter_PresenterInterface!

    var forecast: DarkSkyForecast?
}

extension ForecastPresenter: ForecastPresenter_ViewControllerInterface {

    func updateForecast() {
        guard let interactor = interactor else {
            print("Forecast interactor missing")
            return
        }
        interactor.fetchForecast()
    }

    func handleSwipeLeft() {
        if let forecast = forecast {
            router.displayForecastDetails(forecast)
        } else {
            fatalError("No forecast.")
        }
    }

    func handleSwipeRight() {
        if let forecast = forecast {
            router.displayAlmanac(forecast)
        } else {
            fatalError("No forecast.")
        }
    }
}

extension ForecastPresenter: ForecastPresenter_InteractorInterface {

    func fetchForecastSucceeded(_ forecast: DarkSkyForecast) {
        self.forecast = forecast
        DispatchQueue.main.sync() {
            viewController.setCurrentSummary(forecast.currently?.summary ?? "?")
            if let temperature = forecast.currently?.temperature {
                let value  = String(round(temperature * 10.0) / 10)
                let symbol = temperatureSymbol(units: forecast.flags?.units)
                viewController.setCurrentTemperature(value + symbol)
                print(forecast.today?.temperatureHigh ?? "High?")
            } else {
                viewController.setCurrentTemperature("")
            }
        }
    }

    func fetchForecastFailed(message: String) {
        viewController.setErrorMessage(message)
    }

    private func temperatureSymbol(units: String?) -> String {
        guard let units = units, units != "us" else { return "°F" }
        return "°C"
    }
}
