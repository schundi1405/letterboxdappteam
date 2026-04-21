//
//  ProfileView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var page: ReviewsPage
    @State private var isEditing = false

    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(page.items) { review in
                    HStack(alignment: .top, spacing: 12) {
                        
                        if let path = review.posterPath,
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
                        }
                        
                        VStack(alignment: .leading) {
                            Text(review.movieTitle)
                                .font(.headline)
                            
                            Text("⭐️ \(review.rating)/5")
                            
                            Text(review.text)
                                .lineLimit(2)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(page.color.opacity(0.5)) // background color
                        
            .navigationTitle("Welcome, Sindhu!")
            
            
            .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    isEditing = true
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundStyle(page.color)
                                        .font(.system(size: 22))
                                }
                            }
                        }
                        
                        .sheet(isPresented: $isEditing) {
                            EditSheet( selectedColor: $page.color)
                        }
        }
    }
}
