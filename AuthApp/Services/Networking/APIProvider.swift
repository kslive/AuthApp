//
//  APIProvider.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Moya

enum APIProvider {
    case auth(login: String, password: String)
    case reports
}

extension APIProvider: TargetType {
    var baseURL: URL {
        API.serverUrl
    }
    
    var path: String {
        switch self {
        case .auth:
            return "/auth"
        case .reports:
            return "/reports"
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .auth(let login, let password):
            return [ParametersKey.login: login,
                    ParametersKey.password: password]
        default:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .reports:
            return ["Authorization":"Bearer \(UserDefManager.shared.getToken())"]
        default:
            return [:]
        }
    }
}
