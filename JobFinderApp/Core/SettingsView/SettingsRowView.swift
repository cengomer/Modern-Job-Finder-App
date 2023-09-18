//
//  SettingsRowView.swift
//  JobFinderApp
//
//  Created by omer elmas on 25.07.2023.
//

import SwiftUI

struct SettingsRowView: View {
    let image: String
    let title: String
    var body: some View {
        HStack(spacing:16) {
            Image(systemName:image)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(image: "person.fill", title: "Account preferences")
    }
}
