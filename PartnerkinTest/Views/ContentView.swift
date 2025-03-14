//
//  ContentView.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    VStack {
                        HStack {
                            Text("Загрузка...")
                            
                            ProgressView()
                        }
                    }
                } else {
                    
                    if let error = viewModel.errorMessage {
                        
                        Text("Ошибка: \(error)")
                            .foregroundColor(.red)
                        
                    } else {
                        LazyVStack (spacing: 12) {
                            ForEach(viewModel.sortedSectionKeys, id: \.self) { section in
                                Section(header: Text(section.capitalized)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 16)
                                    .padding(.top, 46)
                                ) {
                                    ForEach(viewModel.groupedResults[section]!, id: \.conference.id) { result in
                                        NavigationLink(destination: {
                                            DetailsView(conference: result.conference)
                                        }, label: {
                                            ListItemView(conference: result.conference)
                                                .foregroundStyle(.black)
                                        })
                                     }
                                 }
                             }
                        }
                    }
                }
            }
            .navigationTitle("Конференции")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
