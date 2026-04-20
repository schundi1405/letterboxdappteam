//
//  ContentView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/19/26.
//

import SwiftUI

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

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var movies: [Movie] = []
    @State private var isLoading = false
    
    let service = TMDbService()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Search movies or TV shows...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Search") {
                    Task {
                        await search()
                    }
                }
                .padding(.bottom)
                
                if isLoading {
                    ProgressView()
                } else {
                    List(movies) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.displayTitle)
                                .font(.headline)
                            
                            Text(movie.overview ?? "")
                                .font(.caption)
                                .lineLimit(2)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Letterbox")
        }
    }
    
    func search() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            movies = try await service.searchMovies(query: searchText)
        } catch {
            print("Error: \(error)")
        }
    }
}


#Preview {
    ContentView()
}
