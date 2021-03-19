//
//  UpdateStore.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject{
    @Published var updates: [Update]
    
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
    
}
