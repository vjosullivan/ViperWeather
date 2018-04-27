//
//  DetailsRouter.swift
//  ViperWeather
//
//  Created by Vincent O'Sullivan on 16/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

/// Router functions that can be called by the presenter.
protocol DetailsRouter_PresenterInterface {

}

class DetailsRouter {

    // MARK: - VIPER components

    weak var viewController: UIViewController?
//
//    static func assembleModule(_ forecast: DarkSkyForecast) -> UIViewController {
//        print("Assembling details.")
//        fatalError("DetailsRouter.assembleModule() not written.")
//    }
}

extension DetailsRouter: DetailsRouter_PresenterInterface {

}
