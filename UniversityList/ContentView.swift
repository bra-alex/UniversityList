//
//  ContentView.swift
//  UniversityList
//
//  Created by Don Bouncy on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var uc = UniversityController()
    var body: some View {
        NavigationStack{
            if !uc.universities.isEmpty{
                List(uc.universities, id: \.name) { university in
                    Text(university.name)
                        .padding(.vertical, 7)
                }
                .listStyle(.plain)
                .navigationTitle("American Universities")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ProgressView()
            }
        }
        .task {
            await uc.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
