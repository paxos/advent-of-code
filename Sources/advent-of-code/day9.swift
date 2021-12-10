//
//  day2.swift
//  advent-of-code
//
//  Created by Patrick Dinger on 12/2/21.
//

import Foundation

public class Day9: InputReader, Runable {
    struct Counts {
        var value: Int
        var isLow = false
    }

    public func run() -> String {
        let input = readFile(filename: "day9")
        let inputMatrix = input.map { Array($0).map { c in
            Int(String(c))!
        } }

        var riskLevel = 0

        for (y, _) in inputMatrix.enumerated() {
            for (x, _) in inputMatrix[y].enumerated() {
                let current = inputMatrix[y][x]
                let left = inputMatrix[y][safe: x-1] ?? 99
                let right = inputMatrix[y][safe: x + 1] ?? 99

                let top = inputMatrix[safe: y-1]?[safe: x] ?? 99
                let bottom = inputMatrix[safe: y + 1]?[safe: x] ?? 99

                if current < left, current < right, current < top, current < bottom {
                    riskLevel += current + 1
                }
            }
        }

        print("riskLevel: \(riskLevel)")
        return String(riskLevel)
    }

    public func run2() -> String {
        return ""
    }
}
