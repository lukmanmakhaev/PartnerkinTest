//
//  Result.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct ResultModel: Codable {
    let viewType: Int
    let conference: Conference

    enum CodingKeys: String, CodingKey {
        case viewType
        case conference
    }
}
