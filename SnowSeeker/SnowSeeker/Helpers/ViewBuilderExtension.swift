//
//  phoneOnlyStackNavigationView.swift
//  SnowSeeker
//
//  Created by Aleksandar Filipov on 5/24/22.
//

import Foundation
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
