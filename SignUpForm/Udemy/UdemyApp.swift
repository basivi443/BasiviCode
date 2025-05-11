//
//  UdemyApp.swift
//  Udemy
//
//  Created by Basivi Reddy on 10/05/25.
//

import SwiftUI

@main
struct UdemyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(showUsernameError: Binding.constant(false), showEmailError: Binding.constant(false), showPasswordError: Binding.constant(false))
        }
    }
}
