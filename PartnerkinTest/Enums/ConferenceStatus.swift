//
//  ConferenceStatus.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 14.03.2025.
//

import Foundation

enum ConferenceStatus: String, Codable {
    case publish
    case canceled
    
    var localized: String {
        switch self {
        case .publish:
            return NSLocalizedString("conference_status_publish", comment: "Published conference")
        case .canceled:
            return NSLocalizedString("conference_status_cancelled", comment: "Cancelled conference")
        }
    }
}
