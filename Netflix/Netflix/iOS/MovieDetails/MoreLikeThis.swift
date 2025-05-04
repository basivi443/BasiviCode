//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Rama Basivi Reddy   on 01/05/25.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            
            ForEach(0..<movies.count) { index in
                StandardHomeMovie(movie: movies[index])
                    .frame(height: 175)
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}

