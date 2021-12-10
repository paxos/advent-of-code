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

    public struct Point {
        let x: Int
        let y: Int
        let value: Int
    }

    public func getNextNeighbor(inputMatrix: [[Int]], point: Point, points: inout [Point]) {
        let allNeighbors = neighbors(inputMatrix: inputMatrix, point: point).filter { $0.value < 9 }
        let neighbors = allNeighbors.filter { $0.value == point.value + 1 }

        neighbors.forEach { getNextNeighbor(inputMatrix: inputMatrix, point: $0, points: &points) }
        points.append(contentsOf: neighbors)
    }

    public func neighbors(inputMatrix: [[Int]], point: Point) -> [Point] {
        let x = point.x
        let y = point.y

        var result = [Point]()

        if let left = inputMatrix[y][safe: x-1] {
            result.append(Point(x: x-1, y: y, value: left))
        }

        if let right = inputMatrix[y][safe: x + 1] {
            result.append(Point(x: x + 1, y: y, value: right))
        }

        if let top = inputMatrix[safe: y-1]?[safe: x] {
            result.append(Point(x: x, y: y-1, value: top))
        }
        if let bottom = inputMatrix[safe: y + 1]?[safe: x] {
            result.append(Point(x: x, y: y + 1, value: bottom))
        }

        return result.filter { $0.value != 9 }
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
        let input = readFile(filename: "day9")
        let inputMatrix = input.map { Array($0).map { c in
            Int(String(c))!
        } }

        var basins = [Int]()

        for (y, _) in inputMatrix.enumerated() {
            for (x, _) in inputMatrix[y].enumerated() {
                let current = inputMatrix[y][x]
                let left = inputMatrix[y][safe: x-1] ?? 99
                let right = inputMatrix[y][safe: x + 1] ?? 99

                let top = inputMatrix[safe: y-1]?[safe: x] ?? 99
                let bottom = inputMatrix[safe: y + 1]?[safe: x] ?? 99

                // Found a low point
                if current < left, current < right, current < top, current < bottom {
                    // find the basin

                    let lowPoint = Point(x: x, y: y, value: current)
                    var points = [lowPoint]
                    getNextNeighbor(inputMatrix: inputMatrix, point: lowPoint, points: &points)

                    if points.count > 1 {
                        basins.append(points.count)
                    }
                }
            }
        }

        let threeBiggestBasins = basins.sorted().reversed()[0 ... 2]
        let m = threeBiggestBasins[0] * threeBiggestBasins[1] * threeBiggestBasins[2]

        return String(m)
    }
}
