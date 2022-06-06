//
//  Product.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 18/05/22.
//

import Foundation
import SwiftUI

struct Products1: Codable {
    
    let products: [Product1]
    let total, skip, limit: Int
    
    enum CodingKeys: String, CodingKey {
        case products
        case total, skip, limit
    }
}

// MARK: - Product
struct Product1: Codable, Identifiable {
    let id: Int
    let title, productDescription: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}
