//
//  PopularRestaurantsView.swift
//  AnaninPlaces
//
//  Created by Frank on 23/04/21.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants: [Restarurant] = [
        .init(name: "Japan Finest", imageName: "wonder-woman"),
        .init(name: "Bar & Grill", imageName: "wonder-woman"),
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Popular places to eat")
                    .font(.system(size: 14, weight:.semibold))
                
                Spacer()
                
                Text("See all")
                    .font(.system(size: 12, weight:.semibold))
                
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 8) {
                    
                    ForEach(restaurants, id: \.self) { restaurant in
                        
                        HStack(spacing: 8){
                            
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                HStack {
                                    
                                    Text(restaurant.name)
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    })
                                }
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7 ??? Sushi ??? $$")
                                }
                                
                                Text("Tokyo, Japan")
                                
                            }.font(.system(size: 12, weight: .semibold))
                            
                            Spacer()
                        }
                        
                        .frame(width: 240)
                        .asTitle()
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
        
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        // DiscoverView()
        PopularRestaurantsView()
    }
}
