//
//  PreviewList.swift
//  Netflix
//
//  Created by Rama Basivi Reddy   on 02/05/25.
//

import SwiftUI

struct PreviewList: View {
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State private var currentTranslation: CGFloat = 0
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        
        if index != currentSelection {
            return false
        }
        
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTranslation,
                externalDragGesture: externalDragGesture) {
                
                ForEach(0..<movies.count) { movieIndex in
                    let movie = movies[movieIndex]
                    
                    PreviewView(
                        vm: PreviewVM(movie: movie),
                        playVideo: shouldPlayVideo(index: movieIndex))
                        .frame(width: screen.width)
                }
            }
            .frame(width: screen.width)
        }
    }
}
