//
//  advent_of_codeTests.swift
//  advent-of-codeTests
//
//  Created by Patrick Dinger on 12/2/21.
//

@testable import advent_of_code
import XCTest

class day9Tests: XCTestCase {
    func testPart1() throws {
        XCTAssertEqual(Day9().run(), "506")
    }

    func testPart2() throws {
        XCTAssertEqual(Day9().run2(), "2135254")
    }
}
