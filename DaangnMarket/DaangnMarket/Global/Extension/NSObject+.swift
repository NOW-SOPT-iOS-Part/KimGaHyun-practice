//
//  NSObject+.swift
//  DaangnMarket
//
//  Created by Gahyun Kim on 2024/03/29.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
