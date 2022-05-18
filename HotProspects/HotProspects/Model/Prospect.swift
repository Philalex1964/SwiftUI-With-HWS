//
//  Prospect.swift
//  HotProspects
//
//  Created by Aleksandar Filipov on 5/17/22.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let savedFile = "savedFile.json"
    
    init() {
        let url = FileManager.default.getDocumentsDirectory().appendingPathComponent(savedFile)
        if let data = try? Data(contentsOf: url) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
        people = []
    }
    
    private func save() {
        let url = FileManager.default.getDocumentsDirectory().appendingPathComponent(savedFile)
        if let encoded = try? JSONEncoder().encode(people) {
            do {
                try encoded.write(to: url)
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
