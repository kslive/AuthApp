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
    
    func setPassword(code: String) {
        core.setValue(code, forKey: UserDefKey.password)
    }
    
    func getPassword() -> String {
        if let code = core.object(forKey: UserDefKey.password) as? String {
            return code
        }
        return ""
    }
    
    func setAuthState() {
        core.set(true, forKey: UserDefKey.auth)
    }
    
    func getAuthState() -> Bool {
        if let state = core.object(forKey: UserDefKey.auth) as? Bool {
            return state
        }
        return false
    }
}
