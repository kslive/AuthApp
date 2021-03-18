//
//  AuthModel.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

class AuthModel: Codable {
    var message: String?
    var token: String?
    var reason: String?
    var error: Int?

    init(message: String?, token: String?, reason: String?, error: Int?) {
        self.message = message
        self.token = token
        self.reason = reason
        self.error = error
    }
}
