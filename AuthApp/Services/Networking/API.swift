//
//  API.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

enum API {
    static let baseUrl = "http://playground.geeksdevs.com/alfa"
    
    static let urlApi = "/api"
    
    static var serverUrl: URL {
        return URL(string: baseUrl + urlApi)!
    }
}
