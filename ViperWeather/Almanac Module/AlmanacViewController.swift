import UIKit

/// View controller functions that can be called by the router.
protocol AlmanacViewController_RouterInterface: class {
    func presentViewController(_ viewController: UIViewController)
}

/// View controller functions that can be called by the presenter.
protocol AlmanacViewController_PresenterInterface: class {

}

class AlmanacViewController: UIViewController {

    // MARK: - VIPER components

    var presenter: AlmanacPresenter_ViewControllerInterface!

    // MRK: - Lifecycle functions

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AlmanacViewController: AlmanacViewController_PresenterInterface {

}

extension AlmanacViewController: AlmanacViewController_RouterInterface {

    func presentViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
