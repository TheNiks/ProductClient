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

public class ProductsViewModel: ObservableObject {
    @Published var productsListDataNew: Products? = nil
    @Published var error: ErrorManager? = nil
    var productsSubscription = PassthroughSubject<Products, ErrorManager>()
    public var subscription = Set<AnyCancellable>()
    
    init() {
        subscriberProduct()
    }
    
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
