//
//  PopularDestinationsView.swift
//  AnaninPlaces
//
//  Created by Frank on 23/04/21.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "wonder-woman", lagitude: 48.850514, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "wonder-woman", lagitude: 3567988, longitude: 139.7695),
        .init(name: "New York", country: "USA", imageName: "wonder-woman", lagitude: 40.71592, longitude: -74.0055),
    ]
    
    var body: some View {
        
        VStack {
            
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
                        NavigationLink(
                            destination: PopularDestinationDetailsView(destination: destination),
                            label: {PopularDestinationTile(destination: destination)
                                .padding(.bottom)})
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    
    @State var region: MKCoordinateRegion
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.lagitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
           
            VStack(alignment: .leading) {

                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))

                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                
                HStack {
                    Spacer()
                }
                
            }.padding(.horizontal)
            
            HStack {
                
                Text("Location")
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
            
            }.padding(.horizontal)

            Map(coordinateRegion: $region)
                .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
}

struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        
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
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight:.semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTitle()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Wonder Woman", country: "Brazil", imageName: "wonder-woman", lagitude: 48.850514, longitude: 2.341231))
        }
        DiscoverView()
        PopularDestinationsView()
    }
}
