//
//  ContentView.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/19/26.
//

import SwiftUI

import Foundation



//struct Review: Identifiable, Codable {
//    let id: UUID
//    let movieID: Int
//    var text: String
//    var rating: Int
//    var date: Date
//}

import SwiftUI

struct ContentView: View {
    
    @State private var page = ReviewsPage(
           title: "My Reviews",
           items: [],
           color: .blue
       )
    
    var body: some View {
        
        TabView {
            
            SearchView(page: $page)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ProfileView(page: $page)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
