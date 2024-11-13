

//
//  BlueprintListsUITests.swift
//  BlueprintListsUITests
//
//  Created by Otávio Zabaleta on 13/11/2024.
//

import XCTest
@testable import BlueprintLists

final class BlueprintListsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
                
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAddAndRemoveLists() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments += ["UITESTING"]
        app.launch()

        // GIVEN
        let plusButton = app.navigationBars["Blueprint Lists"]/*@START_MENU_TOKEN@*/.buttons["plus"]/*[[".otherElements[\"Add\"]",".buttons[\"Add\"]",".buttons[\"plus\"]",".otherElements[\"plus\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(plusButton.exists)
        plusButton.tap()
        plusButton.tap()
        plusButton.tap()
        
        // THEN
        let collectionViewsQuery = app.collectionViews
        XCTAssertTrue(collectionViewsQuery.staticTexts["List -  1"].exists)
        XCTAssertTrue(collectionViewsQuery.staticTexts["List -  2"].exists)
        XCTAssertTrue(collectionViewsQuery.staticTexts["List -  3"].exists)
        
        // GIVEN
        let list3 = collectionViewsQuery.staticTexts["List -  3"]
        
        // WHEN
        list3.swipeLeft(velocity: XCUIGestureVelocity.fast)
        let btnDelete = app.buttons["Delete"]
        XCTAssertTrue(btnDelete.waitForExistence(timeout: 2))
        app.buttons["Delete"].tap()
        
        // THEN
        XCTAssertFalse(btnDelete.exists)
    }

//    @MainActor
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
