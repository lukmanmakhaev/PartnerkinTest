//
//  ListItemView.swift
//  PartnerinTest
//
//  Created by Lukman Makhaev on 13.03.2025.
//

import SwiftUI
import Kingfisher

struct ListItemView: View {
    let conference: Conference
    
    var body: some View {
        VStack (spacing: 16) {
            
            if conference.status == .canceled {
                HStack (spacing: 2) {
                    Image("bolt")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .scaledToFit()
                    
                    Text(conference.status.localized)
                        .font(.system(size: 11))
                        .fontWeight(.semibold)
                        .foregroundStyle(.colorOrange)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.colorOrange))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Text(conference.name)
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                
                
                KFImage(URL(string: conference.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()

                Text(conference.formattedStartDate)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .frame(height: 104)
            .background(conference.status == .canceled ? .colorOrange.opacity(0.06) : .colorBlue.opacity(0.04))
            .cornerRadius(12)
            .padding(.vertical, 4)
            
            HStack {
                ForEach(conference.categories, id: \.self) { category in
                    Text(category.name)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .clipShape(Capsule())
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
            
            HStack (spacing: 8) {
                Image("location")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .scaledToFit()
                
                Text("\(conference.city), \(conference.country)")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(24)
        .background(conference.status == .canceled ? .colorOrange.opacity(0.08) : .colorGray)
        .cornerRadius(16)
    }
}

#Preview {
    ListItemView(conference: Conference(id: 1,
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
