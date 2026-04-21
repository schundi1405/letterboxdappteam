//
//  EditSheet.swift
//  Letterbox
//
//  Created by Sindhu's iPad on 4/20/26.
//

import SwiftUI

struct EditSheet: View {
    
    @Binding var selectedColor: Color
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                
                ColorChooser(selectedColor: $selectedColor)
                
                Spacer()
            }
            .navigationTitle("Edit Profile")
        }
    }
}
