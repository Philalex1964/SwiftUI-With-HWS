//
//  LocationFetcherContentView.swift
//  UsersWithPhotoAndLocations
//
//  Created by Aleksandar Filipov on 5/16/22.
//

import SwiftUI

struct LocationFetcherContentView: View {
    let locationFetcher = LocationFetcher()

    var body: some View {
        VStack {
            Button("Start Tracking Location") {
                self.locationFetcher.start()
            }

            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
                }
            }
        }
    }
}

struct LocationFetcherView_Previews: PreviewProvider {
    static var previews: some View {
        LocationFetcherView()
    }
}
