//
//  InputReader.swift
//  advent-of-code
//
//  Created by Patrick Dinger on 12/2/21.
//

import Foundation

public class InputReader {
    public func readFile(filename: String) -> [String] {
        do {
            let path = Bundle.module.path(forResource: filename, ofType: "txt")!
            let file = try String(contentsOfFile: path)
            let text: [String] = file.components(separatedBy: "\n")
            return text
        } catch {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
        return []
    }
}
