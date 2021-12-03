//
//  advent_of_codeTests.swift
//  advent-of-codeTests
//
//  Created by Patrick Dinger on 12/2/21.
//

@testable import advent_of_code
import XCTest

class day3Tests: XCTestCase {
    func testPart1() throws {
        measure {
            XCTAssertEqual(Day3().run(), "2595824")
        }
    }

    func testPart2() throws {
        measure {
            XCTAssertEqual(Day3().run2(), "2135254")
        }
    }
}
