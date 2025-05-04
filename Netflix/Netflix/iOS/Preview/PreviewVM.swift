//
//  PreviewVM.swift
//  Netflix
//
//  Created by Rama Basivi Reddy   on 02/05/25.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
