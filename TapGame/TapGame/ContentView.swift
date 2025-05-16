//
//  ContentView.swift
//  TapGame
//
//  Created by Basivi Reddy on 12/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer = Timer.publish(every: Difficulty.easy.rawValue, on: .main, in: .common).autoconnect()
    @State private var currentPicIndex = 0
    @State private var targetIndex = 1
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isGameRunning = true
    @State private var difficulty: Difficulty = .easy
    let possiblePics = ["apple", "dog", "egg"]
    var randomTarget: Int {
        return Int.random(in: 0..<possiblePics.count)
    }
    
    enum Difficulty: Double {
        case easy = 1, medium = 0.5, hard = 0.1
        
        var title: String {
            switch self {
            case .easy:
                return "Easy"
            case .medium:
                return "Medium"
            case .hard:
                return "Hard"
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                if !isGameRunning {
                    Menu("Difficulty \(difficulty.title)") {
                        Button(Difficulty.easy.title, action: {
                            difficulty = .easy
                        })
                        Button(Difficulty.medium.title, action: {
                            difficulty = .medium
                        })
                        Button(Difficulty.hard.title, action: {
                            difficulty = .hard
                        })
                    }
                }
                Spacer()
                Text("Score: \(score)")
            }
            .padding(.horizontal)
            Image(possiblePics[currentPicIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .onTapGesture {
                    timer.upstream.connect().cancel()
                    isGameRunning = false
                    if currentPicIndex == targetIndex {
                        score += 1
                        alertTitle = "Success!"
                        alertMessage = "You got the correct answer!"
                    } else {
                        alertTitle = "Incorrect."
                        alertMessage = "You chose the wrong answer."
                    }
                    showAlert = true
                }
            Text(possiblePics[targetIndex])
                .font(.headline)
                .padding(.top)
            if !isGameRunning {
                Button("Restart Game", action: {
                    isGameRunning = true
                    targetIndex = randomTarget
                    timer = Timer.publish(every: difficulty.rawValue, on: .main, in: .common).autoconnect()
                })
                .padding(.top)
            }
        }
        .onReceive(timer, perform: { _ in
            changePic()
        })
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", action: {
                
            })
        } message: {
            Text(alertMessage)
        }
        
    }
    
    func changePic() {
        if currentPicIndex == possiblePics.count - 1 {
            currentPicIndex = 0
        } else {
            currentPicIndex += 1
        }
    }
    
}

#Preview {
    ContentView()
}
