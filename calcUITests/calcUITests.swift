import XCTest

final class calcUITests: XCTestCase {

    func testCalculatorUI() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Give the app time to fully load
        sleep(1)
        
        // Print all available buttons for debugging
        print("Available buttons: \(app.buttons.allElementsBoundByIndex.map { $0.identifier })")
        
        // Look for buttons with the right identifiers
        let button2 = app.buttons["2"]
        let buttonAdd = app.buttons["+"]
        let button3 = app.buttons["3"]
        let buttonEqual = app.buttons["="]
        
        // Check if buttons exist and tap them
        XCTAssertTrue(button2.exists, "Button '2' not found")
        button2.tap()
        
        XCTAssertTrue(buttonAdd.exists, "Button '+' not found")
        buttonAdd.tap()
        
        XCTAssertTrue(button3.exists, "Button '3' not found")
        button3.tap()
        
        XCTAssertTrue(buttonEqual.exists, "Button '=' not found")
        buttonEqual.tap()
        
        // Add a slight delay to allow the UI to update
        sleep(1)
        
        // Use a more flexible way to find the result - look for any text containing "5"
        let displayValues = app.staticTexts.allElementsBoundByIndex
        
        // Debug: print all text elements
        print("All text elements:")
        for element in displayValues {
            print("Text element: '\(element.label)' with identifier: '\(element.identifier)'")
        }
        
        // Try to find either the specific display OR any text showing "5"
        let resultFound = displayValues.contains { $0.label == "5" }
        XCTAssertTrue(resultFound, "Text with value '5' not found on screen")
    }
}
