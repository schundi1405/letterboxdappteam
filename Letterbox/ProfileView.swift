//
//  ProfileView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var page: ReviewsPage

    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(page.items) { review in
                    VStack(alignment: .leading) {
                        Text(review.movieTitle)
                            .font(.headline)
                        
                        Text("⭐️ \(review.rating)/5")
                        
                        Text(review.text)
                            .lineLimit(2)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
