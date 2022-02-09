//
//  MovieService.swift
//  OmdbAPI With SwiftUI
//
//  Created by Hüseyin İyibaş on 3.02.2022.
//

import Combine
import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(by keyword: String) -> AnyPublisher<SearchResponse, Error>
}

final class MovieService: MovieServiceProtocol {
    func fetchMovies(by keyword: String) -> AnyPublisher<SearchResponse, Error> {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "apiKey", value: APIConstants.apiKey),
            URLQueryItem(name: "s", value: keyword)
        ]
        var urlComponents = URLComponents(string: APIConstants.baseUrl)!
        urlComponents.queryItems = queryItems
        let urlSession = URLSession.shared
        return urlSession
            .dataTaskPublisher(for: urlComponents.url!)
            .print()
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
