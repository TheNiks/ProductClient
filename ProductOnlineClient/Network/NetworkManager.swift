//
//  NetworkManager.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation
import ProductCoreModel

struct ProductsFetchRequestModel: RequestModel {
    var path: String = "/products"
    var parameters: [String : String]? = nil
    var headers: [String : String] = [:]
    var method: RequestHTTPMethod = .get
    var body: [String : Any]? = nil
}

class Services {
    class func fetchProducts(completion: @escaping(Result<Products, ErrorManager>) -> Void) {
        ServiceManager
            .shared
            .sendRequest(request: ProductsFetchRequestModel()) { result in
                completion(result)
            }
    }
}
