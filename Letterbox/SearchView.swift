//
//  SearchView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var movies: [Movie] = []
    @State private var isLoading = false
    
    @Binding var page: ReviewsPage
    
    let service = TMDbService()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                TextField("Search movies...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Search") {
                    Task { await search() }
                }
                
                if isLoading {
                    ProgressView()
                }
                
                List(movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie, page: $page)
                    } label: {
                        Text(movie.displayTitle)
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
    
    func search() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            movies = try await service.searchMovies(query: searchText)
        } catch {
            print(error)
        }
    }
}
