//
//  NetworkService.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    func fetchList() async throws -> APIData {
        guard var urlComponents = URLComponents(string: "https://partnerkin.com/api_ios_test/list") else {
            throw NetworkError.badURL
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: "DMwdj29q@S29shslok2")
        ]
        guard let url = urlComponents.url else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let response = try JSONDecoder().decode(APIResponse.self, from: data)
            
            if let errorMessage = response.error {
                throw NetworkError.apiError(errorMessage)
            }
            return response.data
        } catch {
            throw NetworkError.decodingFailed(error)
        }  
    }
}
