//
//  NetworkManager.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Moya

class NetworkManager {
    private let provider = MoyaProvider<APIProvider>()
    static let shared = NetworkManager()
    
    private init() {}
    
    func auth(login: String, password: String, _ completion: @escaping ((AuthModel?) -> ())) {
        provider.request(.auth(login: login, password: password)) { (result) in
            switch result {
            case .success(let response):
                let decoded = self.decodeJSON(type: AuthModel.self, from: response.data)
                completion(decoded)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reports(_ completion: @escaping ((ReportsModel?) -> ())) {
        provider.request(.reports) { (result) in
            switch result {
            case .success(let response):
                let decoded = self.decodeJSON(type: ReportsModel.self, from: response.data)
                completion(decoded)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension NetworkManager {
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
