//
//  ProductRow.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 18/05/22.
//

import Foundation
import SwiftUI
import ProductCoreModel

/// Product row component.
struct ProductRow: View {
    var product: Product
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 0.0) {
                Text(product.title)
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Text(product.productDescription)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.horizontal, 5.0)
        
    }
}

/// Product row component preview.
struct ProductRow_Preview: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productData)
    }
}
