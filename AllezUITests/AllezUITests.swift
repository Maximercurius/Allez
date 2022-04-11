//
//  AllezUITests.swift
//  AllezUITests
//
//  Created by Makarov_Maxim on 17.03.2022.
//

import XCTest

class AllezUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--UITesting")
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        app.launch()
        
        XCTAssertTrue(app.isOnMainView)
        
        app.navigationBars["Allez.TaskListView"].buttons["Add"].tap()
        app.textFields["Titlle"].tap()
        app.textFields["Titlle"].typeText("Foo")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Bar")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.19")

        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Tyumen")

        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Baz")
        
        XCTAssertFalse(app.isOnMainView)

        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
        XCTAssertTrue(app.tables.staticTexts["Bar"].exists)
        XCTAssertTrue(app.tables.staticTexts["01.01.19"].exists)


    }
    
    func testWhenCellIsSwipedLeftDoneButtonAppeared() {

        app.launch()
        
        XCTAssertTrue(app.isOnMainView)
        
        app.navigationBars["Allez.TaskListView"].buttons["Add"].tap()
        app.textFields["Titlle"].tap()
        app.textFields["Titlle"].typeText("Foo")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Bar")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.19")

        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Tyumen")

        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Baz")
        
        XCTAssertFalse(app.isOnMainView)

        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.isOnMainView)
        
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Done"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "date").label, "")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
extension XCUIApplication {
    var isOnMainView: Bool {
        return otherElements["mainView"].exists
    }
    
}
