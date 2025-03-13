//
//  DataClass.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct DataClass: Codable {
    let counts: Int
    let pagination: Pagination
    let result: [APIResult]
}
