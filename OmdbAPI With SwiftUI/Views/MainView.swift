//
//  MainView.swift
//  OmdbAPI With SwiftUI
//
//  Created by Hüseyin İyibaş on 3.02.2022.
//

import SwiftUI

struct MainView: View {
    @State private var keyword: String = "big"
    @StateObject private var viewModel: MainViewModel = MainViewModel(
        service: MovieService()
    )
    
    var body: some View {
        NavigationView {
            List {
                TextField("", text: $keyword)
                    .onChange(of: keyword) { keyword in
                        viewModel.getMovies(by: keyword)
                    }
                ForEach(viewModel.movies, id: \.id) { movie in
                    ExpandableMovieView(movie: movie)
                }
            }
            .navigationTitle("List Items")
            .onAppear(perform: {
                viewModel.getMovies(by: keyword)
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
