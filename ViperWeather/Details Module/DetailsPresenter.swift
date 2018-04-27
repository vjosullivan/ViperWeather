import Foundation


/// Presenter functions that can be called by the view.
protocol DetailsPresenter_ViewControllerInterface: class {

}

/// Presenter functions that can be called by the interactor.
protocol DetailsPresenter_InteractorInterface: class {

}

/// Receives input from the view and reacts by either:
/// - Requesting data from the interactor, or
/// - Requesting that the router performs navigation.
///
/// Receives updates from the interactor and reats by:
/// - Updating the view.
class DetailsPresenter {

    // MARK: - VIPER components

    weak var viewController:  DetailsViewController_PresenterInterface!
    var interactor: DetailsInteractor_PresenterInterface?
    var router:     DetailsRouter_PresenterInterface!
}

extension DetailsPresenter: DetailsPresenter_ViewControllerInterface {

}

extension DetailsPresenter: DetailsPresenter_InteractorInterface {

}
