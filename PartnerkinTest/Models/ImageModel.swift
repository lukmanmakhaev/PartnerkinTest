//
//  Image.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct Image: Codable {
    let id: String
    let url, preview: String
    let placeholderColor: String?
    let width, height: Int

    enum CodingKeys: String, CodingKey {
        case id, url, preview
        case placeholderColor
        case width, height
    }
}
