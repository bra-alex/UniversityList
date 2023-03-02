//
//  UniversityController.swift
//  UniversityList
//
//  Created by Don Bouncy on 02/03/2023.
//

import Foundation

struct University: Codable{
    let name: String
    let state: String?
    let country: String
    let domains: [String]
    let webPages: [String]
    let alphaTwoCode: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case state = "state-province"
        case country
        case domains
        case webPages
        case alphaTwoCode
    }
}

class UniversityController: ObservableObject{
    @Published var universities = [University]()
    
    func loadData() async {
        guard let url = URL(string: "http://universities.hipolabs.com/search?country=United+States") else {
            print("Unable to parse url")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedData = try decoder.decode([University].self, from: data)
                DispatchQueue.main.async {
                    self.universities = decodedData
                }
        } catch {
            print(String(describing: error))
        }
        
    }
}
