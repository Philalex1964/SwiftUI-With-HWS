//
//  FileManagerWriteExtension.swift
//  BucketList
//
//  Created by Aleksandar Filipov on 5/12/22.
//

import Foundation

extension FileManager {
    func writeToDocumentDirectory(_ text: String, to file: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let url = paths[0].appendingPathComponent(file)
        
        do {
            try text.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
}
