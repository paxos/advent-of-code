//
//  advent_of_codeTests.swift
//  advent-of-codeTests
//
//  Created by Patrick Dinger on 12/2/21.
//

@testable import advent_of_code
import XCTest

class day2Tests: XCTestCase {
    func testPart1() throws {
        XCTAssertEqual(Day2().run(), "1905672874")
    }

    func testPart2() throws {
        XCTAssertEqual(Day2().run2(), "1903644897")
    }
}
