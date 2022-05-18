//
//  DocDirectory.swift
//  HotProspects
//
//  Created by Aleksandar Filipov on 5/18/22.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}
