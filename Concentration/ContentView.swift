//
//  ContentView.swift
//  Concentration
//
//  Created by Blaine Beltran on 8/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var nums = Array(1...30)
    @State var filters = Array(1...10)
    
    var body: some View {
        HStack {
            ForEach(1...4, id: \.self) { _ in
                CardView(isFacedUp: true)
            }
        }
        .padding()
    }
}

struct ContentView_Preview: PreviewProvider  {
    static var previews: some View {
        ContentView()
    }
}

