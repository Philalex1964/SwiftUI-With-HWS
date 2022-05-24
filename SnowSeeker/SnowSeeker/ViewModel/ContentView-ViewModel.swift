//
//  ContentView-ViewModel.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/24/22.
//

import Foundation

enum Sort {
    case none, name, country
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var resorts: [Resort] = Bundle.main.decode("resorts.json")
        
        @Published var searchText = ""
        
        @Published var sorting = Sort.none
        @Published var showingSortMenu = false
        
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
}
