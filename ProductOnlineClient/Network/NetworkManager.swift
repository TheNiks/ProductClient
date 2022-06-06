//
//  NetworkManager.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation
import ProductCoreModel


/// Define products request model params.
struct ProductsFetchRequestModel: RequestModel {
    /// Define api subpath.
    var path: String = "/products"
    /// Define parameters.
    var parameters: [String : String]? = nil
    /// Adding header parametres.
    var headers: [String : String] = [:]
    /// Adding httpmethod.
    var method: RequestHTTPMethod = .get
    /// Adding any parameters for body.
    var body: [String : Any]? = nil
}

/// Define common service class for product.
class Services {
    
    /// API call for fetching products from server.
    /// - Parameter completion: Triggered completion block when api hit and got response
    class func fetchProducts(completion: @escaping(Result<Products, ErrorManager>) -> Void) {
        ServiceManager
            .shared
            .sendRequest(request: ProductsFetchRequestModel()) { result in
                completion(result)
            }
    }
}
