import XCTest
@testable import LogReporter

final class LogReporterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LogReporter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
