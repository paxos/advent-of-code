//
//  day2.swift
//  advent-of-code
//
//  Created by Patrick Dinger on 12/2/21.
//

import Foundation

public class Day3: InputReader, Runable {
    class Counts {
        var ones = 0
        var zeroes = 0
    }

    public func run() -> String {
        let input = readFile(filename: "day3")
        let results = getReport(input: input)

        var gammaString = ""

        for result in results {
            if result.ones > result.zeroes {
                gammaString += "1"
            } else {
                gammaString += "0"
            }
        }

        var epsilonString = ""

        for result in results {
            if result.ones < result.zeroes {
                epsilonString += "1"
            } else {
                epsilonString += "0"
            }
        }

        let gamma = Int(gammaString, radix: 2)!
        let epsilon = Int(epsilonString, radix: 2)!

        return String(gamma * epsilon)
    }

    private func getReport(input: [String]) -> [Day3.Counts] {
        let results = [Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts(), Counts()]

        for number in 0 ... 11 {
            for (_, element) in input.enumerated() {
                let currentCharacter = Array(element)[number]
                if currentCharacter == "0" {
                    results[number].zeroes += 1
                } else {
                    results[number].ones += 1
                }
            }
        }

        return results
    }

    public func run2() -> String {
        let input = readFile(filename: "day3")
        var results = getReport(input: input)

        var oxygenFiltered = Array(input)

        var oxygen = 0

        for number in 0 ... 11 {
            results = getReport(input: oxygenFiltered)
            oxygenFiltered = oxygenFiltered.filter { element in
                let currentCharacter = Array(element)[number]
                if results[number].ones >= results[number].zeroes {
                    return currentCharacter == "1"
                } else {
                    return currentCharacter == "0"
                }
            }

            if oxygenFiltered.count == 1 {
                oxygen = Int(oxygenFiltered.first!, radix: 2)!
                break
            }
        }

        results = getReport(input: input)
        var scrubberFiltered = Array(input)

        var scrubber = 0

        for number in 0 ... 11 {
            results = getReport(input: scrubberFiltered)

            scrubberFiltered = scrubberFiltered.filter { element in
                let currentCharacter = Array(element)[number]
                if results[number].ones >= results[number].zeroes {
                    return currentCharacter == "0"
                } else {
                    return currentCharacter == "1"
                }
            }
            if scrubberFiltered.count == 1 {
                scrubber = Int(scrubberFiltered.first!, radix: 2)!
                break
            }
        }

        print(String(oxygen * scrubber))
        return String(oxygen * scrubber)
    }
}
