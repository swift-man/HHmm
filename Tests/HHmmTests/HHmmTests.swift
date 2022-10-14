import XCTest
@testable import HHmm

final class HHmmTests: XCTestCase {
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
  
  func testCreateToString() {
    let hhmm = HHmm(text: "08:15")
    XCTAssertEqual(hhmm.hour, 08)
    XCTAssertEqual(hhmm.minute, 15)
    XCTAssertEqual(hhmm.value, "08:15")
  }
  
  func testCreateInt() {
    let hhmm = HHmm(hour: 06, minute: 45)
    XCTAssertEqual(hhmm.hour, 06)
    XCTAssertEqual(hhmm.minute, 45)
    XCTAssertEqual(hhmm.value, "06:45")
  }
}
