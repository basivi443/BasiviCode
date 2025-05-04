//
//  ComingSoonVM.swift
//  Netflix
//
//  Created by Rama Basivi Reddy   on 02/05/25.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
