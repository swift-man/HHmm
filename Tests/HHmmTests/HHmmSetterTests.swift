//
//  HHmmSetterTests.swift
//  HHmmTests
//
//  Created by SwiftMan on 2022/10/15.
//

import XCTest
@testable import HHmm

final class HHmmSetterTests: XCTestCase {
    func testSetter_5_7() {
      var hhmm = HHmm(text: "03:05")
      XCTAssertEqual(hhmm.hour, 3)
      XCTAssertEqual(hhmm.minute, 5)
      hhmm.hour = 5
      hhmm.minute = 7
      XCTAssertEqual(hhmm.hour, 5)
      XCTAssertEqual(hhmm.minute, 7)
      XCTAssertEqual(hhmm.isEmpty, false)
    }
  
  func testSetter_8_45() {
    var hhmm = HHmm(text: "08:45")
    XCTAssertEqual(hhmm.hour, 8)
    XCTAssertEqual(hhmm.minute, 45)
    hhmm.hour = 18
    hhmm.minute = 17
    XCTAssertEqual(hhmm.hour, 18)
    XCTAssertEqual(hhmm.minute, 17)
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testSetter_6_45() {
    var hhmm = HHmm(hour: 06, minute: 45)
    hhmm.hour = 24
    hhmm.minute = 00
    XCTAssertEqual(hhmm.hour, 0)
    XCTAssertEqual(hhmm.minute, 0)
    XCTAssertEqual(hhmm.value, "00:00")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testSetter_7_45() {
    var hhmm = HHmm(hour: 07, minute: 45)
    hhmm.hour = 24
    hhmm.minute = 01
    XCTAssertEqual(hhmm.hour, 0)
    XCTAssertEqual(hhmm.minute, 1)
    XCTAssertEqual(hhmm.value, "00:01")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
}
