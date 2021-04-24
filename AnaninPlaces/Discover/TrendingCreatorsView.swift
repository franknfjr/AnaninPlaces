//
//  TrendingCreatorsView.swift
//  AnaninPlaces
//
//  Created by Frank on 23/04/21.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Frank Ferreira", imageName: "wonder-woman"),
        .init(name: "Rafaela Ferreira", imageName: "wonder-woman"),
        .init(name: "Noah Ferreira", imageName: "wonder-woman"),
        .init(name: "File Ferreira", imageName: "wonder-woman"),
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Trending Creators")
                    .font(.system(size: 14, weight:.semibold))
                
                Spacer()
                
                Text("See all")
                    .font(.system(size: 12, weight:.semibold))
                
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top,spacing: 8) {
                    
                    ForEach(users, id: \.self) { user in
                        
                        VStack {
                            
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(60)
                            
                            Text(user.name)
                                .font(.system(size: 11, weight:.semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
