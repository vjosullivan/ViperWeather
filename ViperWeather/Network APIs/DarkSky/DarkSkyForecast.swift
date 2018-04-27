//
//  DaerSkyWeather.swift
//  ViperWeather
//
//  Created by Vincent O'Sullivan on 15/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct DarkSkyForecast: Codable {
    let latitude:  Double
    let longitude: Double
    let timezone:  String

    let currently: DarkSkyDataPoint?

    let minutely:  DarkSkyDataBlock?
    let hourly:    DarkSkyDataBlock?
    let daily:     DarkSkyDataBlock?

    let alerts:    [DarkSkyAlert]?
    let flags:     DarkSkyFlags?

    var today: DarkSkyDataPoint? {
        return daily?.data[0]
    }
}
