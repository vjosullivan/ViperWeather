import UIKit

/// View controller functions that can be called by the router.
protocol ForecastViewController_RouterInterface: class {
    func presentViewController(_ viewController: UIViewController)
}

/// View controller functions that can be called by the presenter.
protocol ForecastViewController_PresenterInterface: class {
    func setCurrentSummary(_ currentSummary: String)
    func setCurrentTemperature(_ currentTemperature: String)
    func setErrorMessage(_ message: String)
}

class ForecastViewController: UIViewController {

    var presenter: ForecastPresenter_ViewControllerInterface!

    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var temperature: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateForecast()

        let directions: [UISwipeGestureRecognizerDirection] = [.left, .right, .up, .down]
        for direction in directions {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToGesture(_:)))
            swipe.direction = direction
            self.view.addGestureRecognizer(swipe)
        }
    }

    // MARK: - Actions

    @IBAction func updateForecast() {
        presenter.updateForecast()
    }

    // MARK: - Local methods

    @objc
    private func respondToGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                presenter.handleSwipeRight()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                presenter.handleSwipeLeft()
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}

extension ForecastViewController: ForecastViewController_PresenterInterface {

    func setCurrentSummary(_ currentSummary: String) {
        summary.text = currentSummary
    }

    func setCurrentTemperature(_ currentTemperature: String) {
        temperature.text = currentTemperature
    }
    func setErrorMessage(_ message: String) {
        summary.text = message
        temperature.text = ""
    }
}

extension ForecastViewController: ForecastViewController_RouterInterface {

    func presentViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
