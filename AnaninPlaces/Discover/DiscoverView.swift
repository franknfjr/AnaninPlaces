//
//  ContentView.swift
//  AnaninPlaces
//
//  Created by Frank on 21/04/21.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}
struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.6823529412, blue: 0.231372549, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.4862745098, blue: 0.2509803922, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                    Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {
             
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                        
                        Text("Where do you want to go?")
                        
                        Spacer()
                        
                    }.font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    AnaninCategoriesView()
                    
                    VStack {
                        
                        PopularDestinationsView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                        
                    }.background(Color.discoverBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
            }
                
            }.navigationTitle("AnaninPlaces")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
