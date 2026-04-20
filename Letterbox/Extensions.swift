//
//  Extensions.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/19/26.
//

import Foundation

extension Movie {
    var posterURL: URL? {
        guard let poster_path = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
}
