//
//  MovieDetailView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    @Binding var page: ReviewsPage
    
    @State private var text = ""
    @State private var rating = 3
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text(movie.displayTitle)
                .font(.title)
                .bold()
            
            TextEditor(text: $text)
                .frame(height: 120)
                .border(Color.gray)
            
            Stepper("Rating: \(rating)", value: $rating, in: 1...5)
            
            Button("Save Review") {
                
                let newReview = Review(
                    movieID: movie.id,
                    movieTitle: movie.displayTitle,
                    text: text,
                    rating: rating,
                    date: Date()
                )
                
                page.items.append(newReview)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}
