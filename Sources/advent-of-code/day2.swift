//
//  day2.swift
//  advent-of-code
//
//  Created by Patrick Dinger on 12/2/21.
//

import Foundation

public class Day2: InputReader, Runable {
    class Submarine {
        var depth = 0
        var horizontal = 0
        var aim = 0
    }
    
    public func run() -> String {
        let input = readFile(filename: "day2")
        
        let sub = Submarine()
        
        for line in input {
            let commands = line.components(separatedBy: " ")
            
            if line.isEmpty { continue }
            
            let value = Int(commands[1])!
            switch commands[0] {
            case "up":
                sub.depth -= value
                sub.aim -= value
            case "down":
                sub.aim += value
                sub.depth += value
            case "forward":
                sub.horizontal += value
                sub.depth += sub.aim * value
            default:
                Swift.print("Something went wrong!")
            }
        }
        
        print("Done")
        print("Depth: \(sub.depth), horizontal: \(sub.horizontal)")
        print(CGFloat(sub.horizontal) * CGFloat(sub.depth))
        return String(Int(sub.horizontal) * Int(sub.depth))
    }
    
    public func run2() -> String {
        let input = readFile(filename: "day2")
        
        let sub = Submarine()
        
        for line in input {
            let commands = line.components(separatedBy: " ")
            
            if line.isEmpty { continue }
            
            let value = Int(commands[1])!
            switch commands[0] {
            case "up":
                // sub.depth -= value
                sub.aim -= value
            case "down":
                sub.aim += value
            //  sub.depth += value
            case "forward":
                sub.horizontal += value
                sub.depth += sub.aim * value
            default:
                Swift.print("Something went wrong!")
            }
        }
        
        print("Done")
        print("Depth: \(sub.depth), horizontal: \(sub.horizontal)")
        print(CGFloat(sub.horizontal) * CGFloat(sub.depth))
        return String(Int(sub.horizontal) * Int(sub.depth))
    }
}
