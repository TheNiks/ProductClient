//
//  NetworkManager.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation
import ProductCoreModel

struct ProfilesFetchRequestModel: RequestModel {
    var path: String = "/products"
    
    var parameters: [String : String]? = nil
    
    var headers: [String : String] = [:]
    
    var method: RequestHTTPMethod = .get
    
    var body: [String : Any]? = nil
    
}

struct HomeContentFetchRequestModel: RequestModel {
    
    var profileID: Int
    
    var path: String {
        get { return "/profilehome/" + String(format: "%ld", profileID) }
        set { }
    }
    
    var parameters: [String : String]? = nil
    
    var headers: [String : String] = [:]
    
    var method: RequestHTTPMethod = .get
    
    var body: [String : Any]? = nil
}

class Services {
    class func fetchProducts(completion: @escaping(Result<Products, ErrorManager>) -> Void) {
        ServiceManager
            .shared
            .sendRequest(request: ProfilesFetchRequestModel()) { result in
                completion(result)
            }
    }
}
