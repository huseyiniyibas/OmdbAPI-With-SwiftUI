//
//  SearchResponse.swift
//  OmdbAPI With SwiftUI
//
//  Created by Hüseyin İyibaş on 3.02.2022.
//

import Foundation

struct SearchResponse: Decodable {
    var Search: [Movie]?
    var totalResults: String?
    var Response: String?
    var Error: String?
}
