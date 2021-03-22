//
//  DataStore.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/21.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
