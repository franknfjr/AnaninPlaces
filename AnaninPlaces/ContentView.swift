//
//  ContentView.swift
//  AnaninPlaces
//
//  Created by Frank on 21/04/21.
//

import SwiftUI

struct ContentView: View {
    
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
                
                Color(.init(white: 0.95, alpha: 1))
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
                        
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 32)
            }
                
            }.navigationTitle("AnaninPlaces")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Category: Hashable {
    let name, imageName: String
}

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
                }
            }.padding(.horizontal)
        }
    }
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "wonder-woman"),
        .init(name: "Tokyo", country: "Japan", imageName: "wonder-woman"),
        .init(name: "New York", country: "USA", imageName: "wonder-woman")
    ]
    
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
                ForEach(destinations, id: \.self) { destination in
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Image(destination.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .cornerRadius(4)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 6)
                        
                        
                        Text(destination.name)
                            .font(.system(size: 12, weight:.semibold))
                            .padding(.horizontal, 12)
                        
                        Text(destination.country)
                            .font(.system(size: 12, weight:.semibold))
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)
                            .foregroundColor(.gray)
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                    .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct Restarurant: Hashable {
    let name, imageName: String
}

struct PopularRestaurantsView: View {
    
    let restaurants: [Restarurant] = [
        .init(name: "Japan Finest", imageName: "wonder-woman"),
        .init(name: "Bar & Grill", imageName: "wonder-woman"),
    ]
    
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
                                Text("4.7 • Sushi • $$")
                            }
                            
                            Text("Tokyo, Japan")

                        }.font(.system(size: 12, weight: .semibold))
                        
                        Spacer()
                    }

                        .frame(width: 240)
                    .background(Color.white)
                        .cornerRadius(5)
                    .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct User: Hashable {
    let name, imageName: String
}
struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Frank Ferreira", imageName: "wonder-woman"),
        .init(name: "Rafaela Ferreira", imageName: "wonder-woman"),
        .init(name: "Noah Ferreira", imageName: "wonder-woman"),
        .init(name: "File Ferreira", imageName: "wonder-woman"),
    ]
    
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
