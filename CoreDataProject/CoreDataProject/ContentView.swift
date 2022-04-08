//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Aleksandar Filipov on 4/7/22.
//
import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Trek")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Star Trek", "Aliens", "Firefly", "Star Wars"])) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name Contains %@", "e")) var ships: FetchedResults<Ship>
//    var compoundPredicate = NSCompoundPredicate(
    
    var body: some View {
        List(ships, id: \.self) { ship in
            Text(ship.name ?? "Unknown name")
        }
        
        Button("Add Examples") {
            let ship1 = Ship(context: moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: moc)
            ship3.name = "Millennium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            try? moc.save()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
