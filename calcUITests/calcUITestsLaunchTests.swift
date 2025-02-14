import XCTest

final class calcUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.exists)
    }
}
