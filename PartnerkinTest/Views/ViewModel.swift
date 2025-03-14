//
//  ViewModel.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    @Published var APIResults: [APIResult] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = true
    
    private let repository = NetworkService()
    
    init(){
        fetchItems()
    }
    
    
    func fetchItems() {
        Task {
            isLoading = true
            do {
                let data = try await repository.fetchList()
                self.APIResults = data.result
                isLoading = false
            } catch {
                self.errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
    
    var groupedResults: [String: [APIResult]] {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "ru_RU")
        
        let sectionFormatter = DateFormatter()
        sectionFormatter.dateFormat = "LLLL, yyyy"
        sectionFormatter.locale = Locale(identifier: "ru_RU")
        
        var groups = [String: [APIResult]]()
        for result in APIResults {
            if let date = inputFormatter.date(from: result.conference.startDate) {
                let sectionTitle = sectionFormatter.string(from: date)
                groups[sectionTitle, default: []].append(result)
            } else {
                groups["Unknown Date", default: []].append(result)
            }
        }
        return groups
    }
    
    var sortedSectionKeys: [String] {
        groupedResults.keys.sorted { key1, key2 in
            let formatter = DateFormatter()
            formatter.dateFormat = "LLLL, yyyy"
            formatter.locale = Locale(identifier: "ru_RU")
            guard let date1 = formatter.date(from: key1),
                  let date2 = formatter.date(from: key2) else {
                return key1 < key2
            }
            return date1 < date2
        }
    }
    
}
