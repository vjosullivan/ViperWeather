//
//  RootRouter.swift
//  ViperWeather
//
//  Created by Vincent O'Sullivan on 16/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class RootRouter {
    func presentForecastScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ForecastModule.assembled()
    }
}
