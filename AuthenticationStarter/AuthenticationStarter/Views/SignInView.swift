//
//  SignInView.swift
//  AuthenticationStarter
//
//  Created by Work on 13.12.21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct SignInView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 15) {
//            LogoView()
            Spacer()
            SignInCredentialFields(email: $email, password: $password)
            Button(action: {
                signInUser(userEmail: email, userPassword: password)
            }) {
                Text("Log In")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
            
            if signInProcessing {
                ProgressView()
            }
            if !signInErrorMessage.isEmpty {
                Text("Failed creating account: \(signInErrorMessage)")
                    .foregroundColor(.red)
            }
            
            SignWithAppleButton()
            
            GoogleSignInButton()
                .frame(width: 360, height: 50)
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    viewModel.signIn()
                }
            
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    viewModel.state = .signUp
                }) {
                    Text("Sign Up")
                }
            }
            .opacity(0.9)
        }
        .padding()
    }
    
    func signInUser(userEmail: String, userPassword: String) {
        signInProcessing = true
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }
            
            switch authResult {
            case .none:
                print("Could not sign in user.")
                signInProcessing = false
            case .some(_):
                print("User signed in")
                signInProcessing = false
                withAnimation {
                    viewModel.state = .signedIn
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SignInCredentialFields: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("Email", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
        }
    }
}


