//
//  ProductsViewModel.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation
import Combine
import SwiftUI
import ProductCoreModel

/// It's utilise for API call and save response in model object.
public class ProductsViewModel: ObservableObject {
    
    /// It's store api updated response.
    @Published var productsListDataNew: Products? = nil
    /// Save error when throw from API.
    @Published var error: ErrorManager? = nil
    /// Define publisher when API calling process complete.
    var productsSubscription = PassthroughSubject<Products, ErrorManager>()
    /// Store publisher into stack
    public var subscription = Set<AnyCancellable>()
    
    /// Initialisation method for product view model.
    init() {
        subscriberProduct()
    }
    
    /// Subscribe products stream.
    private func subscriberProduct() {
        productsSubscription
            .receive(on: DispatchQueue.main)
            .sink { completion in
            switch completion {
            case .finished:
                self.error = nil
            case .failure(let error):
                self.error = error
            }
        } receiveValue: { response in
            self.productsListDataNew = response
        }
        .store(in: &subscription)
    }
    
    /// Service API call for products.
    func serviceProducts() {
        Services.fetchProducts { result in
            switch result {
            case .success(let response):
                self.productsSubscription.send(response)
            case .failure(let error):
                self.productsSubscription.send(completion: .failure(error))
            }
        }
    }
    
    deinit {
        
    }
}
