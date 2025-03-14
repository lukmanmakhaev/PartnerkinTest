//
//  NetworkError.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case apiError(String)
    case decodingFailed(Error)
}
