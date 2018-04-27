import Foundation


/// Presenter functions that can be called by the view.
protocol AlmanacPresenter_ViewControllerInterface: class {

}

/// Presenter functions that can be called by the interactor.
protocol AlmanacPresenter_InteractorInterface: class {

}

/// Receives input from the view and reacts by either:
/// - Requesting data from the interactor, or
/// - Requesting that the router performs navigation.
///
/// Receives updates from the interactor and reats by:
/// - Updating the view.
class AlmanacPresenter {

    // MARK: - VIPER components

    weak var viewController:  AlmanacViewController_PresenterInterface!
    var interactor: AlmanacInteractor_PresenterInterface?
    var router:     AlmanacRouter_PresenterInterface!
}

extension AlmanacPresenter: AlmanacPresenter_ViewControllerInterface {

}

extension AlmanacPresenter: AlmanacPresenter_InteractorInterface {

}
