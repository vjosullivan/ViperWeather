import Foundation

/// Interactor functions that can be called by the presenter.
protocol ForecastInteractor_PresenterInterface: class {
    func fetchForecast()
}

class ForecastInteractor: ForecastInteractor_PresenterInterface {

    weak var presenter: ForecastPresenter_InteractorInterface!
    
    func fetchForecast() {
        DarkSkyAPI().fetchForecast(
            completionHandler: presenter.fetchForecastSucceeded,
            errorHandler: presenter.fetchForecastFailed)
    }
}
