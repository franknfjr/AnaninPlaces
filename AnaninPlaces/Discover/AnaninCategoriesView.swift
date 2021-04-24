//
//  AnaninCategoriesView.swift
//  AnaninPlaces
//
//  Created by Frank on 23/04/21.
//

import SwiftUI

struct AnaninCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .top, spacing: 14) {
                
                ForEach(categories, id: \.self) { category in
                    
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack(spacing: 8) {
                                
                                Image(systemName: category.imageName)
                                    .font(.system(size: 22))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6235294118, blue: 0.231372549, alpha: 1)))
                                    .frame(width: 68, height: 68)
                                    .background(Color.white)
                                    .cornerRadius(68)
                                
                                Text(category.name)
                                    .font(.system(size: 12, weight:.semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                
                            }.frame(width: 68)
                        })
                }
            }.padding(.horizontal)
        }
    }
}

struct CategoryDetailsView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<5, id: \.self) { num in
                VStack(alignment: .leading, spacing: 0) {
                    Image("wonder-woman")
                        .resizable()
                        .scaledToFill()
                    Text("Wonder Woman")
                        .font(.system(size: 12, weight: .semibold))
                        .padding()
                    
                }.asTitle()
                .padding()
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
//        ZStack {
//            Color.orange
//            AnaninCategoriesView()
//        }
    }
}
