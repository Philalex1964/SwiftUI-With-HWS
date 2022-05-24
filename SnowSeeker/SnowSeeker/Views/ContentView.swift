//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @StateObject var favorites = Favorites()

    var body: some View {
        NavigationView {
            List(viewModel.filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay (
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $viewModel.searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    viewModel.showingSortMenu = true
                } label: {
                    Label("Sort", systemImage: "person.crop.rectangle.stack")
                }
                
            }
            .confirmationDialog("Sort", isPresented: $viewModel.showingSortMenu) {
                Button("Name") {
                    viewModel.sorting = .name
                }
                Button("Country") {
                    viewModel.sorting = .country
                }
                Button("Default") {
                    viewModel.sorting = .none
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Sort by:")
            }

            
            WelcomeView()
        }
//        .phoneOnlyStackNavigationView()
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
