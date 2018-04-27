import UIKit

/// Router functions that can be called by the presenter.
protocol AlmanacRouter_PresenterInterface {

}

class AlmanacRouter {

    // MARK: - VIPER components

    weak var viewController: UIViewController?
//
//    static func assembleModule(_ forecast: DarkSkyForecast) -> UIViewController {
//        print("Assembling almanac.")
//        fatalError("AlmanacRouter.assembleModule() not written.")
//    }
}

extension AlmanacRouter: AlmanacRouter_PresenterInterface {

}
