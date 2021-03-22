//
//  UpdateStore.swift
//  DesignCode3rd
//
//  Created by 仝华帅 on 2021/3/21.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
