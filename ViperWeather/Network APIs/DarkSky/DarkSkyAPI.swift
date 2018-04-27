//
//  DarkSkyAPI.swift
//  ViperWeather
//
//  Created by Vincent O'Sullivan on 18/04/2018.
//  Copyright © 2018 Vincent O'Sullivan. All rights reserved.
//

import Foundation

struct DarkSkyAPI {

    private static let darkSkyUrl = "https://api.darksky.net/forecast/"
    private static let darkSkyAPIKey: String? = "7f7075d90bf85644daa070b898a10132"
    private static let ukSuffix   = "units=uk2"

    fileprivate let url: URL

    /// Initialises a `DarkSkyClient` with a set location.
    ///
    /// - parameter location: A location on the Earth's surface.
    /// - returns: A `DarkSkyClient` dedicated to the suppled location.
    ///
    init() {
        self.init(location: Location(latitude: 51.5, longitude: -1.0))
    }

    /// Initialises a `DarkSkyClient` with a set location.
    ///
    /// - parameter location: A location on the Earth's surface.
    /// - returns: A `DarkSkyClient` dedicated to the suppled location.
    ///
    init(location: Location) {
        if let darkSkyAPIKey = DarkSkyAPI.darkSkyAPIKey {
            url = URL(string: DarkSkyAPI.darkSkyUrl + darkSkyAPIKey +
                "/\(location.latitude),\(location.longitude)" +
                "?units=auto")!
        } else {
            fatalError("Dark Sky API key required.")
        }
    }

    /// Initialiser: Utilises "dependency injection" to initialise the client with a predefined URL.
    ///
    /// - parameter url: A URL (usually containing test data).
    /// - returns: A `DarkSkyClient` initialised with test data.
    ///
    public init(url: URL) {
        self.url = url
    }

    public func fetchForecast(
        completionHandler: @escaping (DarkSkyForecast) -> Void,
        errorHandler: @escaping (String) -> Void) {

        fetchData {(data, _, error) in
            guard let data = data else {
                if let error = error {
                    errorHandler(error.localizedDescription)
                }
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            do {
                let forecast = try decoder.decode(DarkSkyForecast.self, from: data)
                completionHandler(forecast)
            } catch {
                errorHandler("Unable to create a forecast from the forecast data.")
            }
        }
    }

    private typealias DarkSkyHandler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void


    private func fetchData(completionHandler handler: @escaping DarkSkyHandler) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: handler)
        task.resume()
    }
}
