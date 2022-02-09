//
//  MainViewModel.swift
//  OmdbAPI With SwiftUI
//
//  Created by Hüseyin İyibaş on 3.02.2022.
//

import Combine
import Foundation

protocol MainViewModelProtocol {
    func getMovies(by keyword: String)
}

final class MainViewModel: MainViewModelProtocol, ObservableObject {
    @Published private(set) var movies: [Movie] = []
    
    private let service: MovieService
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(service: MovieService) {
        self.service = service
    }
    
    func getMovies(by keyword: String) {
        service.fetchMovies(by: keyword)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Completion finished")
                case .failure(let error):
                    print("error: ", error.localizedDescription)
                }
            }, receiveValue: { movies in
                self.movies = movies.Search ?? []
            })
            .store(in: &cancellableSet)
    }
}
