import XCTest

final class calcUITests: XCTestCase {

    func testCalculatorUI() throws {
        let app = XCUIApplication()
        app.launch()

        let button2 = app.buttons["2"]
        let button3 = app.buttons["3"]
        let buttonAdd = app.buttons["+"]
        let buttonEqual = app.buttons["="]

        button2.tap()
        buttonAdd.tap()
        button3.tap()
        buttonEqual.tap()

        let result = app.staticTexts["5"]
        XCTAssert(result.exists)
    }
}
