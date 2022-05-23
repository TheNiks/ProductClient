//
//  ProductDetail.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 19/05/22.
//

import SwiftUI
import ProductCoreModel

struct ProductDetail: View {
    var productInfo: Product
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<productInfo.images.count, id: \.self) {
                            ProductImageView(img: productInfo.images[$0])
                        }
                    }
                }
                .background(.gray)
                .padding([.top, .leading, .trailing])
                .padding(.bottom)
                VStack {
                    HStack() {
                        Text("Name:")
                            .padding(.leading, 15.0)
                        Text(productInfo.title)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    HStack() {
                        Text("Description :")
                            .padding(.leading, 15.0)
                        Text(productInfo.productDescription)
                            .padding(.leading, 2.0)
                        Spacer()
                    }
                    .padding(.top, 10.0)
                    HStack() {
                        Text("Qty :")
                            .padding(.leading, 15.0)
                        Text(String(productInfo.stock))
                            .padding(.leading, 65.0)
                        Spacer()
                    }
                    .padding(.top, 10.0)
                    HStack() {
                        Text("Discount :")
                            .padding(.leading, 15.0)
                        Text(String(productInfo.discountPercentage))
                            .padding(.leading, 25.0)
                        Spacer()
                    }
                    .padding(.top, 10.0)
                }
                Spacer()
            }
            .navigationTitle("Product Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ProductsDetails_Previews: PreviewProvider {
    static var previews: some View {
        let productJsonString = """
            {
              "id": 1,
              "title": "iPhone X",
              "description": "An apple mobile which is nothing like apple",
              "price": 549,
              "discountPercentage": 12.96,
              "rating": 4.69,
              "stock": 94,
              "brand": "Apple",
              "category": "smartphones",
              "thumbnail": "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
              "images": [
                "https://dummyjson.com/image/i/products/1/1.jpg",
                "https://dummyjson.com/image/i/products/1/2.jpg",
                "https://dummyjson.com/image/i/products/1/3.jpg",
                "https://dummyjson.com/image/i/products/1/4.jpg",
                "https://dummyjson.com/image/i/products/1/thumbnail.jpg"
              ]
            }
        """
        
    }
}

struct ProductImageView: View {
    @State var img: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: img)) { proImg in
                proImg.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 200, height: 200)
        }
    }
}
