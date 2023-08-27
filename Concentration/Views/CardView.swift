//
//  CardView.swift
//  Concentration
//
//  Created by Blaine Beltran on 8/26/23.
//

import SwiftUI

struct CardView: View {
    var isFacedUp = false
    var body: some View {
        ZStack {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.blue)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue)
            }
        }
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
