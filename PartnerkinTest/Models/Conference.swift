//
//  Conference.swift
//  PartnerinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

struct Conference: Codable {
    let id: Int
    let name: String
    let format: String
    let status: ConferenceStatus
    let statusTitle: String
    let url: String
    let image: ConferenceImage
    let rating: Int?
    let startDate, endDate: String
    let oneday: Int
    let customDate: Date?
    let countryID: Int
    let country: String
    let cityID: Int
    let city: String
    let categories: [APICategory]
    let typeID: Int
    let type: TypeClass
    
    enum CodingKeys: String, CodingKey {
        case id, name, format, status
        case statusTitle = "status_title"
        case url, image, rating
        case startDate = "start_date"
        case endDate = "end_date"
        case oneday
        case customDate = "custom_date"
        case countryID = "country_id"
        case country
        case cityID = "city_id"
        case city, categories
        case typeID = "type_id"
        case type
    }
}

extension Conference {
    
    static let inputFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    var startDateValue: Date? {
        return Conference.inputFormatter.date(from: startDate)
    }
    
    var formattedStartDate: String {
        guard let date = startDateValue else { return startDate }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: date)
    }
    
    var detailsDate: String {
        guard let date = startDateValue else { return startDate }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }
    
    var totalDays: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_RU")
        
        guard let start = formatter.date(from: startDate),
              let end = formatter.date(from: endDate) else { return 0 }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: start, to: end)
        return (components.day ?? 0)
    }

}
