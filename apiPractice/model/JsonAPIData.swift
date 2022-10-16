//
//  JsonData.swift
//  apiPractice
//
//  Created by sweta makuwala on 11/09/22.
//

import Foundation
struct JsonApiData: Decodable {
    let errorMessage: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let name, email, id, joining: String
}
