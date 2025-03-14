//
//  Pagination.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct Pagination: Codable {
    let pageSize: Int
    let currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case currentPage = "current_page"
    }
}
