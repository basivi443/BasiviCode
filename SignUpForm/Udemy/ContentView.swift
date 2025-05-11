//
//  ContentView.swift
//  Udemy
//
//  Created by Basivi Reddy on 10/05/25.
//

import SwiftUI

// MARK: - Parent View
struct ContentView: View {
    @State private var showUsernameError = false
    @State private var showEmailError = false
    @State private var showPasswordError = false

    var body: some View {
        NavigationStack{
            SignUpFormView(
                showUsernameError: $showUsernameError,
                showEmailError: $showEmailError,
                showPasswordError: $showPasswordError
            )
        }
        
    }
}

// MARK: - Child (Reusable) View
struct SignUpFormView: View {
    @Binding var showUsernameError: Bool
    @Binding var showEmailError: Bool
    @Binding var showPasswordError: Bool

    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoading = false
    @State private var isSuccess = false
    @State private var navigateToHome = false

    var body: some View {
        ZStack {
            Color.primaryTheme
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                headerView
                formField(title: "UserName", text: $username, showError: $showUsernameError, errorMessage: "UserName should not be empty!")
                formField(title: "Email", text: $email, showError: $showEmailError, errorMessage: "Email should not be empty!")
                formField(title: "Password", text: $password, showError: $showPasswordError, errorMessage: "Password should not be empty!", isSecure: true)

                submitButton

                Spacer()
            }
            .padding()
            .alert("Sign Up completed!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    navigateToHome = true
                }
            } message: {
                Text("Thanks for signing up!")
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }

    private var headerView: some View {
        Text("SignUp")
            .foregroundStyle(.white)
            .font(.system(size: 30, weight: .bold))
    }

    @ViewBuilder
    private func formField(title: String, text: Binding<String>, showError: Binding<Bool>, errorMessage: String, isSecure: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))

            if isSecure {
                SecureField(title, text: text)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
            } else {
                TextField(title, text: text)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }

            if showError.wrappedValue {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.top, 5)
            }
        }
    }

    private var submitButton: some View {
        HStack {
            Spacer()
            
            Button(action: {
                validateAndSubmit()
            }) {
                ZStack {
                    if isSuccess {
                        Image(systemName: "checkmark")
                            .font(.headline)
                            .foregroundColor(.white)
                    } else if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Submit")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .frame(width: isLoading ? 60 : UIScreen.main.bounds.width - 64, height: 60)
                .background(isSuccess ? Color.green : Color.blue)
                .clipShape(Capsule())
            }
            .disabled(isLoading)

            Spacer()
        }
        .padding(.top, 20)
    }


    private func validateAndSubmit() {
        showUsernameError = username.isEmpty
        showEmailError = email.isEmpty
        showPasswordError = password.isEmpty

        guard !showUsernameError && !showEmailError && !showPasswordError else { return }
        withAnimation(.easeInOut(duration: 0.4)) {
            isLoading = true
        }

        // In a real app, use encryption or keychain for password handling.
        showAlert = true
        if showAlert{
            withAnimation(.easeInOut(duration: 0.4)) {
                isSuccess = true
            }
        }
       
    }
}
