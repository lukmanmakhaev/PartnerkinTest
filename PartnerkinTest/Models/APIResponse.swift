//
//  Responce.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct Response: Codable {
    let error: String?
    let data: DataClass
}
