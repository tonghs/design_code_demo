//
//  Array+Only.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/4/1.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
