import Foundation

/// Interactor functions that can be called by the presenter.
protocol AlmanacInteractor_PresenterInterface: class {

}

class AlmanacInteractor: AlmanacInteractor_PresenterInterface {

    // MARK: - VIPER components

    weak var presenter: AlmanacPresenter_InteractorInterface!
}
