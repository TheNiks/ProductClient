//
//  ServiceManager.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation

class ServiceManager {
    static let shared: ServiceManager = ServiceManager()
    var baseURL: String = "http://127.0.0.1:8080/api"
}

extension ServiceManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Result<T, ErrorManager>) -> Void) {
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            
            guard let data = data, let parsedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                
                let error: ErrorManager = ErrorManager(ErrorType.parsing.rawValue)
                completion(.failure(error))
                return
            }
            
            var responseModel: ResponseModel<T> = .init()
            responseModel.isSuccess = true
            responseModel.data = parsedResponse
            responseModel.rawData = data
            responseModel.request = request

            if responseModel.isSuccess, let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorManager.generalError()))
            }
            
        }.resume()
    }
}
