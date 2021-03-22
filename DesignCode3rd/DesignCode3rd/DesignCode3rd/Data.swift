//
//  Data.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/21.
//

import SwiftUI

struct Post: Codable, Identifiable{
    var id: Int
    var title: String
    var body: String
    
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        .resume()
    }
}
