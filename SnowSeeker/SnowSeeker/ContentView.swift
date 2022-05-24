//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/20/22.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum Sort {
    case none, name, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    @State private var sorting = Sort.none
    @State private var showingSortMenu = false

    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
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
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    showingSortMenu = true
                } label: {
                    Label("Sort", systemImage: "person.crop.rectangle.stack")
                }
                
            }
            .confirmationDialog("Sort", isPresented: $showingSortMenu) {
                Button("Name") {
                    sorting = .name
                }
                Button("Country") {
                    sorting = .country
                }
                Button("Default") {
                    sorting = .none
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
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            switch sorting {
            case .name:
                return resorts.sorted { $0.name < $1.name }
            case .country:
                return resorts.sorted { $0.country < $1.country }
            default:
                return resorts
            }
            
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
