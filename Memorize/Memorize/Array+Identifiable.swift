//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/4/1.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching item: Element) -> Int? {
        for index in 0 ..< self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil
    }
}
