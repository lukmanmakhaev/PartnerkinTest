//
//  NetworkServiceProtocol.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchList() async throws -> APIData
}
