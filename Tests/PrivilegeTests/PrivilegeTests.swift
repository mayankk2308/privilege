import XCTest
@testable import Privilege

final class PrivilegeTests: XCTestCase {
    
    // Must enter correct administrator password to succeed.
    func testPrivileges() {
        XCTAssertTrue(Privilege.escalate())
        XCTAssertTrue(Privilege.deEscalate())
    }

    static var allTests = [
        ("testPrivileges", testPrivileges)
    ]
}
