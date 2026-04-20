//
//  TMDbService.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/19/26.
//

import Foundation

class TMDbService {
    
    private let apiKey = "7d709b3b3f3072896d262613199bf760"
    
    func searchMovies(query: String) async throws -> [Movie] {
        
        let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let urlString = """
        https://api.themoviedb.org/3/search/multi?query=\(formattedQuery)&api_key=\(apiKey)
        """
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(TMDbResponse.self, from: data)
        
        return response.results
    }
}

struct TMDbResponse: Codable {
    let results: [Movie]
}
