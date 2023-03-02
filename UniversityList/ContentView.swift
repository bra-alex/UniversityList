//
//  ContentView.swift
//  UniversityList
//
//  Created by Don Bouncy on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var uc = UniversityController()
    @State private var showDetails = false
    @State private var university: University?
    var body: some View {
        NavigationStack{
            ZStack{
                if !uc.universities.isEmpty{
                    List(uc.universities, id: \.name) { university in
                        Text(university.name)
                            .padding(.vertical, 7)
                            .onTapGesture {
                                self.university = university
                                showDetails = true
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Universities")
                    .navigationBarTitleDisplayMode(.inline)
                    
                } else {
                    ProgressView()
                }
                
                if showDetails{
                    UniversityPopup(showDetails: $showDetails, university: university!)
                }
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
