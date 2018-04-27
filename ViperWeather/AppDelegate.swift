//
//  AppDelegate.swift
//  ViperWeather
//
//  Created by Vincent O'Sullivan on 15/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentForecastScreen(in: window!)

//        window?.makeKeyAndVisible()
//        let rvc = ForecastRouter.assembleModule()
//        window?.rootViewController = rvc
        return true
    }
}

