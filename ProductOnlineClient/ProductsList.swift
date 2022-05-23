//
//  ProductsList.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 18/05/22.
//

import SwiftUI

struct ProductsList: View {
    @StateObject var productVM = ProductsViewModel()
    var body: some View {
        NavigationView {
            if let products = productVM.productsListDataNew?.products {
                List(products, id: \.id) { rowData in
                    NavigationLink {
                        ProductDetail(productInfo: rowData)
                    } label: {
                        ProductRow(product: rowData)
                    }
                }
                .navigationBarTitle(Text("Product List"), displayMode: .inline)
            }
        }.onAppear {
            productVM.serviceProducts()
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList()
    }
}
