//
//  ContentView.swift
//  ScrambledWords
//
//  Created by Basivi Reddy on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var letters: [String] = ["O", "R", "A", "N", "G", "E"]
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Spacer()
                        Image("apple")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                        VStack{
                            LetterView(character: "")
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 25, height: 2)
                        }
                        .padding(.bottom,20)
                        
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.border, lineWidth: 2.0)
                    }
                    Text("Score: 0")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .padding(.top)
                    
                    HStack{
                        ForEach(letters, id: \.self){ letter in
                            LetterView(character: letter)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LetterView: View{
    var character: String
    var body: some View{
        Text(character)
            .foregroundStyle(.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
