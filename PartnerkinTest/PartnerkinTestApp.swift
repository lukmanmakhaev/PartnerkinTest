//
//  PartnerkinTestApp.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import SwiftUI

@main
struct PartnerkinTestApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
