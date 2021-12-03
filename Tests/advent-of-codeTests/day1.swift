//
//  advent_of_codeTests.swift
//  advent-of-codeTests
//
//  Created by Patrick Dinger on 12/2/21.
//

@testable import advent_of_code
import XCTest

class day1Tests: XCTestCase {
    func testPart1() throws {
        XCTAssertEqual(Day1().run(), "1581")
    }

    func testPart2() throws {
        XCTAssertEqual(Day1().run2(), "1618")
    }
}
