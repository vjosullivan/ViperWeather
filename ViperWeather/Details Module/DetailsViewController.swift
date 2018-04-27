import UIKit

/// View controller functions that can be called by the router.
protocol DetailsViewController_RouterInterface: class {
    func presentViewController(_ viewController: UIViewController)
}

/// View controller functions that can be called by the presenter.
protocol DetailsViewController_PresenterInterface: class {

}

class DetailsViewController: UIViewController {

    // MARK: - VIPER components

    var presenter: DetailsPresenter_ViewControllerInterface!

    // MRK: - Lifecycle functions

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailsViewController: DetailsViewController_PresenterInterface {

}

extension DetailsViewController: DetailsViewController_RouterInterface {

    func presentViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
