//
//  File.swift
//  
//
//  Created by Patrick Dinger on 12/9/21.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
