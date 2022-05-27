//
//  MotherView.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: HomeView()
        case .signedOut: SignInView()
        case .signUp: SignUpView()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(AuthenticationViewModel())
    }
}
