import Foundation

public class Day1: InputReader, Runable {
    public func run() -> String {
        let input = readFile(filename: "day1").map { Int($0)! }
        var increments = 0

        for (index, element) in input.enumerated() {
            if index == 0 { continue }
            if input[index - 1] < element {
                increments += 1
            }
        }

        print("Total elements: \(input.count); Increments: \(increments)")
        return String(increments)
    }

    public func run2() -> String {
        let input = readFile(filename: "day1").map { Int($0)! }
        var increments = 0

        var output: [Int] = []

        for (index, element) in input.enumerated() {
            if index == input.count - 2 { break }
            output.append(input[index] + input[index + 1] + input[index + 2])
        }

        for (index, element) in output.enumerated() {
            if index == 0 { continue }
            if output[index - 1] < element {
                increments += 1
            }
        }

        print("Total elements: \(input.count); Increments: \(increments)")
        return String(increments)
    }
}
