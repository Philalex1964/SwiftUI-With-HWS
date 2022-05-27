//
//  MotherView.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI

struct MotherView: View {
    
//    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
//        switch viewRouter.currentPage {
//        case .signUpPage:
//            SignUpView()
//        case .signInPage:
//            SignInView()
//        case .homePage:
//            HomeView()
//        }
        
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
