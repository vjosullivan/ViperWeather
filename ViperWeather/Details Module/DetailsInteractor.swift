import Foundation

/// Interactor functions that can be called by the presenter.
protocol DetailsInteractor_PresenterInterface: class {

}

class DetailsInteractor: DetailsInteractor_PresenterInterface {

    // MARK: - VIPER components

    weak var presenter: DetailsPresenter_InteractorInterface!
}
