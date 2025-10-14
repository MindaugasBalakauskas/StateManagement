//
//  Array+Load.swift
//  StateManagement
//
//  Created by M Balakauskas on 14/10/2025.
//

import Foundation

extension Array where Element: Decodable {
    static func fromJSON(named fileName: String) throws -> [Element] {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json")
        else {
            fatalError("Could not decode\(fileName).json in main bundle.")
        }
        guard let data = try? Data(contentsOf: fileURL)
        else {
            fatalError("Could not decode\(fileName).json from main bundle")
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([Element].self, from: data)
        } catch {
            fatalError("Could not decode\(fileName).json from main bundle")
        }
    }
}
    

