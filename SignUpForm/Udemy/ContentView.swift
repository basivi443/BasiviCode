//
//  ContentView.swift
//  Udemy
//
//  Created by Basivi Reddy on 10/05/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var showUsernameError: Bool
    @Binding var showEmailError: Bool
    @Binding var showPasswordError: Bool
    var body: some View {
        ChildView(username: "", password: "", email: "", userNameError: false, emailError: false, passwordError: false, showAlert: false)
       
    }
}

struct ChildView: View {
    @State var username: String
    @State var password: String
    @State var email: String
    @State var userNameError: Bool
    @State var emailError: Bool
    @State var passwordError: Bool
    @State var showAlert: Bool
    var body: some View {
        
        ZStack() {
            Color.primaryTheme
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading,spacing: 20){
                Text("SignUp")
                    .foregroundStyle(.white)
                    .font(.system(size: 30, weight: .bold))
                Text("UserName")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                TextField("Username", text: $username)
                    .foregroundStyle(.black)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if userNameError{
                    Text("UserName should not be empty!")
                        .foregroundStyle(.red)
                        .font(.system(size: 12, weight: .bold))
                        .padding(.top,-10)
                }
                Text("Email")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                TextField("Email", text: $email)
                    .foregroundStyle(.black)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if emailError{
                    Text("Email should not be empty!")
                        .foregroundStyle(.red)
                        .font(.system(size: 12, weight: .bold))
                        .padding(.top,-10)
                }
                Text("Password")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .bold))
                TextField("Password", text: $password)
                    .foregroundStyle(.black)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if passwordError{
                    Text("Password should not be empty!")
                        .foregroundStyle(.red)
                        .font(.system(size: 12, weight: .bold))
                        .padding(.top,-10)
                }
                
                Button {
                    
                    guard !username.isEmpty else {
                        userNameError = true
                        return
                    }
                    userNameError = false
                    guard !email.isEmpty else {
                        emailError = true
                        return
                    }
                    emailError = false
                    guard !password.isEmpty else {
                        passwordError = true
                        return
                    }
                    
                   
                    passwordError = false
                    showAlert = true
                   
                } label: {
                    Text("Submit")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                      
                        
                }
                .frame(maxWidth:.infinity)
                .frame(height: 45)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top,20)

                Spacer()
            }.padding()
                .alert("Sign Up completed!", isPresented: $showAlert) {
                    Text("Thanks for signing up!")
                }
            
        }
       
    }
}



//#Preview {
//    ContentView()
//}
