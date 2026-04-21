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
                        
                        HStack(alignment: .top, spacing: 12) {
                            
                    
                            if let path = movie.poster_path,
                               let url = URL(string: "https://image.tmdb.org/t/p/w200\(path)") {
                                
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 90)
                                .clipped()
                                .cornerRadius(8)
                                .shadow(radius: 3)
                            }
                            
                        
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text(movie.displayTitle)
                                    .font(.headline)
                                
                                if let overview = movie.overview {
                                    Text(overview)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(3)
                                }
                            }
                        }
                        .padding(.vertical, 6)
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
