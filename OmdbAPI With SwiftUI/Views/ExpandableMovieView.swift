//
//  ExpandableMovieView.swift
//  OmdbAPI With SwiftUI
//
//  Created by Hüseyin İyibaş on 4.02.2022.
//

import SwiftUI

struct ExpandableMovieView: View {
    var movie: Movie?
    @State private var isExpanded: Bool = false
    
    var body: some View {
        content
            .padding(.leading)
            .frame(maxWidth: .infinity)
            
    }
    
    private var header: some View {
        Text(movie?.Title ?? "")
            .onTapGesture {
                isExpanded.toggle()
            }
            .animation(.linear(duration: 0.3))
    }
    
    private var content: some View {
        VStack {
            header
            if isExpanded {
                VStack {
                    Text(movie?.Year ?? "")
                    Text(movie?.imdbID ?? "")
                    Text(movie?.Poster ?? "")
                }
                .animation(.linear(duration: 0.3))
            }
        }
    }
}

struct ExpandableMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableMovieView(movie: nil)
    }
}
