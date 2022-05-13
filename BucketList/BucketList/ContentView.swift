//
//  ContentView.swift
//  BucketList
//
//  Created by Aleksandar Filipov on 5/12/22.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
//    @State private var locations = [Location]()
//    
//    @State private var selectedPlace: Location?
//    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text(location.name)
                            .fixedSize()
                    }
                    .onTapGesture {
                        viewModel.selectedPlace = location
                    }
                }
            }
            .ignoresSafeArea()
            
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        viewModel.addLocation()
//                        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: viewModel.mapRegion.center.latitude, longitude: viewModel.mapRegion.center.longitude)
//                        viewModel.locations.append(newLocation)
                        //                    print(locations)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $viewModel.selectedPlace) { place in
            EditView(location: place) { newLocation in
                viewModel.update(location: newLocation)
//                if let index = viewModel.locations.firstIndex(of: place) {
//                    viewModel.locations[index] = newLocation
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




