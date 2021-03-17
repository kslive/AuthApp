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
