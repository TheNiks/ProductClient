/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation
import ProductCoreModel

var productsListData: Products = load("ProductData.json")
var productData: Product =  loadFromString("""
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
                                       """)

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func loadFromString<T: Decodable>(_ jsonString: String) -> T {
    var data: Data?
    do {
        data = try jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data!)
    } catch {
        fatalError("Couldn't load from main bundle:\n\(error)")
    }
}
