//
//  UniversityPopup.swift
//  UniversityList
//
//  Created by Don Bouncy on 02/03/2023.
//

import SwiftUI

struct UniversityPopup: View {
    @Environment(\.dismiss) var dismiss
    let university: University
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.3)
            VStack {
                VStack{
                    Text(university.name)
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(.blue)
                
                Group{
                    HStack{
                        Text("Domains")
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Spacer()
                        
                        VStack {
                            ForEach(university.domains, id:\.self) { domain in
                                Text(domain)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding([.horizontal, .top])
                    
                    Divider()
                    
                    HStack{
                        Text("Web Pages")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack {
                            ForEach(university.webPages, id:\.self) { webPage in
                                Text(webPage)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                
                Group {
                    if let state = university.state{
                        HStack {
                            Text("State")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(state)
                                .font(.subheadline)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                    }
                    
                    HStack {
                        Text("Country")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(university.country)
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Text("Country Code")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(university.alphaTwoCode)
                            .font(.subheadline)
                    }
                    .padding([.bottom, .horizontal])
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width - 50)
            .background(.white)
            .cornerRadius(25)
        }
        .onTapGesture {
            dismiss()
        }
    }
}

struct UniversityPopup_Previews: PreviewProvider {
    static var previews: some View {
        UniversityPopup(university: University(name: "Marywood University", state: nil, country: "United States", domains: ["marywood.edu"], webPages: ["http://www.marywood.edu"], alphaTwoCode: "US"))
    }
}
