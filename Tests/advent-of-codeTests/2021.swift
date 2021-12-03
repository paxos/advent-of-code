//
//  advent_of_codeTests.swift
//  advent-of-codeTests
//
//  Created by Patrick Dinger on 12/2/21.
//

@testable import advent_of_code
import XCTest

class advent_of_codeTests: XCTestCase {
    
    func testDay1() throws {
        XCTAssertEqual(Day1().run(), "1581")

    }
    
    func testDay2_Part1() throws {
        XCTAssertEqual(Day2().run(), "1905672874")
    }
    
    func testDay2_Part2() throws {
        XCTAssertEqual(Day2().run2(), "1903644897")
    }
}
