//
//  HomeView.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView {
            Text("HomeView")
                .navigationTitle("V24")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
