//
//  Models.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import Foundation


struct Movie: Identifiable, Codable {
    let id: Int
    let title: String?
    let name: String?
    let overview: String?
    let poster_path: String?
    
    var displayTitle: String {
        return title ?? name ?? "Unknown"
    }
}

struct Review: Identifiable {
    var id = UUID()
    var movieID: Int
    var movieTitle: String
    var posterPath: String? 
    var text: String
    var rating: Int
    var date: Date
    var isCompleted: Bool = false
}
