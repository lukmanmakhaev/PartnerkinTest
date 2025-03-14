//
//  DetailsView.swift
//  PartnerkinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    var conference: Conference
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                
                Text("Конференция")
                    .font(.system(size: 14))
                
                Text(conference.name)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                
                KFImage(URL(string: conference.image.url))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .padding(.vertical, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(conference.categories, id: \.id) { category in
                            Text(category.name)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(.colorGray)
                                .clipShape(Capsule())
                        }
                    }
                }
                
                
                VStack (alignment: .leading) {
                    HStack(spacing: 8) {
                        Image("calendar")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.accent)
                            .frame(width: 24, height: 24)
                        
                        Text("\(conference.detailsDate), \(conference.totalDays)")
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 8) {
                        Image("location")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.accent)
                            .frame(width: 24, height: 24)
                            .scaledToFit()
                        
                        Text("\(conference.city), \(conference.country)")
                            .font(.subheadline)
                    }
                }
                .padding(.vertical, 20)
                
      
                Button(action: {
                    print("Registration")
                }) {
                    Text("Регистрация")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.accent)
                        .cornerRadius(12)
                }
                .padding(.top, 8)
                
             
                Text("О событии")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 80)
                
                Text("EDCON 2024 представляет собой событие, которое объединяет спикеров высшего уровня и предлагает релевантный контент для участников. Это не просто конференция, это возможность погрузиться в мир Ethereum и встретиться с представителями крупнейшего сообщества со всей планеты.")
                .font(.body)
                .padding(.top, 12)
                
                Spacer(minLength: 24)
            }
            .padding()
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailsView(conference: Conference(id: 1,
                                       name: "SiGMA Africa 2025",
                                       format: "offline",
                                       status: .canceled,
                                       statusTitle: "Опубликована",
                                       url: "sigma-africa-2025",
                                       image: ConferenceImage(id: "f4bad773d6e5c03bc934706d88785bbf",
                                                              url: "https://partnerkin.com/uploads/webp/conferences/81e62a7f948c48175e7d5eaa.webp",
                                                              preview: "https://partnerkin.com/uploads/webp/conferences/81e62a7f948c48175e7d5eaa.webp",
                                                              placeholderColor: nil,
                                                              width: 480,
                                                              height: 320),
                                       rating: nil,
                                       startDate: "2025-03-10",
                                       endDate: "2025-03-12",
                                       oneday: 0,
                                       customDate: nil,
                                       countryID: 52,
                                       country: "ЮАР",
                                       cityID: 1274,
                                       city: "Кейптаун",
                                       categories: [APICategory(id: 4,
                                                                name: "Affiliate",
                                                                url: "affiliate"),
                                                    APICategory(id: 4,
                                                                name: "Marketing",
                                                                url: "marketing")
                                       ],
                                       typeID: 2,
                                       type: TypeClass(id: 2, name: "Конференция")))
}
