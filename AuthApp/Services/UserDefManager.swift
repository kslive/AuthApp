//
//  UserDefManager.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import Foundation

class UserDefManager {
    private let core = UserDefaults.standard
    static let shared = UserDefManager()
    
    private init() {}
    
    func setPassword(code: String, _ isSet: (() -> ())?) {
        core.setValue(code, forKey: UserDefKey.password)
        isSet?()
    }
    
    func getPassword() -> String {
        if let code = core.object(forKey: UserDefKey.password) as? String {
            return code
        }
        return ""
    }
    
    func setToken(token: String) {
        core.set(token, forKey: UserDefKey.token)
    }
    
    func getToken() -> String {
        if let token = core.object(forKey: UserDefKey.token) as? String {
            return token
        }
        return ""
    }
}
