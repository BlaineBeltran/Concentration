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
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center) {
                    ForEach(1...10, id: \.self) { count in
                        /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                    }
                }
            }
            .frame(height: 50)
            .scrollIndicators(.hidden)
            List(nums, id: \.self) { num in
                Text("\(num)")
            }
            .navigationTitle("Jobs")
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
