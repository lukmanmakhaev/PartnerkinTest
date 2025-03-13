//
//  Conference.swift
//  PartnerinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


// MARK: - Conference
struct Conference: Codable {
    let id: Int
    let name, format, status, statusTitle: String
    let url: String
    let image: Image
    let rating: Int?
    let startDate, endDate: String
    let oneday: Int
    let customDate: Date?
    let countryID: Int
    let country: String
    let cityID: Int
    let city: String
    let categories: [Category]
    let typeID: Int
    let type: TypeClass

    enum CodingKeys: String, CodingKey {
        case id, name, format, status
        case statusTitle
        case url, image, rating
        case startDate
        case endDate
        case oneday
        case customDate
        case countryID
        case country
        case cityID
        case city, categories
        case typeID
        case type
    }
}

