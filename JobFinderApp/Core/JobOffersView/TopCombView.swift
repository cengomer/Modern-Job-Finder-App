//
//  TopCombView.swift
//  JobFinderApp
//
//  Created by omer elmas on 24.07.2023.
//

import SwiftUI

struct TopCombView: View {
    var body: some View {
        HStack {
            Text("Top Companies")
                .font(.system(size: 22))
                .fontWeight(.semibold)
            Spacer()
            Text("See All")
                .font(.system(size: 20))
                .fontWeight(.semibold)
        }
        .padding(.horizontal , 6)
    }
}

struct TopCombView_Previews: PreviewProvider {
    static var previews: some View {
        TopCombView()
    }
}
