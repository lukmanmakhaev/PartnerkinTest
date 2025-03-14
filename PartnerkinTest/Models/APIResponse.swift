//
//  Responce.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct APIResponse: Codable {
    let error: String?
    let data: APIData
}
