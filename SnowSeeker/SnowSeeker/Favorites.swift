//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/23/22.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    
    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    init() {
        resorts = []
        
        loadData()
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        saveData()
    }
    
    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        saveData()
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([String].self, from: data)  {
                resorts = Set(decoded)
            }
        }
    }
}
