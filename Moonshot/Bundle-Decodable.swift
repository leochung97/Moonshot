//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Leo Chung on 1/3/24.
//

// We can use generics to make Bundle.main.decode work with multiple data types
// <T> is a shorthand placeholder for "Type"
// Swift will prevent you from decoding any Type so you should add T: Codable as a constraint to make sure only decodable types are decoded
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        
        // You can tell the decoder to parse dates in the exact format we expect
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

import Foundation
