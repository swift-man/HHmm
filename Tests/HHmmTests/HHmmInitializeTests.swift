import XCTest
@testable import HHmm

final class HHmmInitializeTests: XCTestCase {
    func testCreateToDate_20_20() {
      let dateComponents = DateComponents(year: 2022, month: 10, day: 15, hour: 20, minute: 20)
      if let date = Calendar.current.date(from: dateComponents) {
        let hhmm = HHmm(date: date)
        XCTAssertEqual(hhmm.hour, 20)
        XCTAssertEqual(hhmm.minute, 20)
        XCTAssertEqual(hhmm.value, "20:20")
      } else {
        XCTFail("date is nil")
      }
    }
  
  func testCreateToString_08_15() {
    let hhmm = HHmm(text: "08:15")
    XCTAssertEqual(hhmm.hour, 08)
    XCTAssertEqual(hhmm.minute, 15)
    XCTAssertEqual(hhmm.value, "08:15")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_00_00() {
    let hhmm = HHmm(text: "0000")
    XCTAssertEqual(hhmm.hour, 0)
    XCTAssertEqual(hhmm.minute, 0)
    XCTAssertEqual(hhmm.value, "00:00")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_24_24() {
    let hhmm = HHmm(text: "2424")
    XCTAssertEqual(hhmm.hour, nil)
    XCTAssertEqual(hhmm.minute, nil)
    XCTAssertEqual(hhmm.isEmpty, true)
  }
  
  func testCreateToString_2_48() {
    let hhmm = HHmm(text: "248")
    XCTAssertEqual(hhmm.hour, 2)
    XCTAssertEqual(hhmm.minute, 48)
    XCTAssertEqual(hhmm.value, "02:48")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_1_1() {
    let hhmm = HHmm(text: "11")
    XCTAssertEqual(hhmm.hour, 1)
    XCTAssertEqual(hhmm.minute, 1)
    XCTAssertEqual(hhmm.value, "01:01")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_9() {
    let hhmm = HHmm(text: "9")
    XCTAssertEqual(hhmm.hour, 9)
    XCTAssertEqual(hhmm.minute, 0)
    XCTAssertEqual(hhmm.value, "09:00")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_23_59() {
    let hhmm = HHmm(text: "2359")
    XCTAssertEqual(hhmm.hour, 23)
    XCTAssertEqual(hhmm.minute, 59)
    XCTAssertEqual(hhmm.value, "23:59")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_01_22() {
    let hhmm = HHmm(text: "오전 01:22")
    XCTAssertEqual(hhmm.hour, 1)
    XCTAssertEqual(hhmm.minute, 22)
    XCTAssertEqual(hhmm.value, "01:22")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateToString_18_38() {
    let hhmm = HHmm(text: "오후 06:38")
    XCTAssertEqual(hhmm.hour, 18)
    XCTAssertEqual(hhmm.minute, 38)
    XCTAssertEqual(hhmm.value, "18:38")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateInt_06_45() {
    let hhmm = HHmm(hour: 06, minute: 45)
    XCTAssertEqual(hhmm.hour, 06)
    XCTAssertEqual(hhmm.minute, 45)
    XCTAssertEqual(hhmm.value, "06:45")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateInt_1_5() {
    let hhmm = HHmm(hour: 1, minute: 5)
    XCTAssertEqual(hhmm.hour, 1)
    XCTAssertEqual(hhmm.minute, 5)
    XCTAssertEqual(hhmm.value, "01:05")
    XCTAssertEqual(hhmm.isEmpty, false)
  }
  
  func testCreateEmpty() {
    let hhmm = HHmm(text: "")
    XCTAssertEqual(hhmm.hour, nil)
    XCTAssertEqual(hhmm.minute, nil)
    XCTAssertEqual(hhmm.value, "")
    XCTAssertEqual(hhmm.isEmpty, true)
  }
}
