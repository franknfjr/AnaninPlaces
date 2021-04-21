//
//  ContentView.swift
//  AnaninPlaces
//
//  Created by Frank on 21/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                AnaninCategoriesView()
                
                PopularDestinationsView()
                
                PopularRestaurantsView()
                
                TrendingCreatorsView()
                
            }.navigationTitle("AnaninPlaces")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnaninCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<10, id: \.self) { num in
                    VStack(spacing: 4) {
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                        Text("Art")
                            .font(.system(size: 12, weight:.semibold))
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct PopularDestinationsView: View {
    
    var body: some View {
        HStack {
            Text("Popular destinations")
                .font(.system(size: 14, weight:.semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight:.semibold))
        }.padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<10, id: \.self) { num in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                            .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct PopularRestaurantsView: View {
    
    var body: some View {
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
                ForEach(0..<10, id: \.self) { num in
                        Spacer()
                            .frame(width: 200, height: 64)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                            .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct TrendingCreatorsView: View {
    
    var body: some View {
        HStack {
            Text("Trending Creators")
                .font(.system(size: 14, weight:.semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight:.semibold))
        }.padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<10, id: \.self) { num in
                    Spacer()
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .cornerRadius(.infinity)
                        .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}
