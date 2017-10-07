//
//  zoopediaUITests.swift
//  zoopediaUITests
//
//  Created by Nadya on 8/22/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import XCTest

class zoopediaUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHomePage() {
        let app = XCUIApplication()
        XCTAssertEqual(app.images.count, 3)
        XCTAssertEqual(app.buttons.count, 3)
        XCTAssertEqual(app.staticTexts.count, 1)
        XCTAssertTrue(app.staticTexts["2017 Copyright Zoopedia. All Rights Reserved."].exists)
    }
    
    func testSelectLevel() {
        let app = XCUIApplication()
        app.buttons.element(matching:.any,identifier:"home_playButton").tap()
        XCTAssertEqual(app.images.count, 1)
        XCTAssertEqual(app.buttons.count, 13)
        XCTAssertEqual(app.staticTexts.count, 1)
        XCTAssertTrue(app.staticTexts["SELECT LEVEL"].exists)
    }
    
    func testDictionary() {
        let app = XCUIApplication()
        app.buttons.element(matching:.any,identifier:"home_dicButton").tap()
        XCTAssertEqual(app.images.count, 1)
        XCTAssertEqual(app.buttons.count, 1)
        XCTAssertEqual(app.staticTexts.count, 2)
        XCTAssertEqual(app.tables.count, 1)
    }
    
    func testQuiz() {
        let app = XCUIApplication()
        app.buttons.element(matching:.any,identifier:"home_playButton").tap()
        app.buttons.element(matching:.any,identifier:"level1").tap()
        XCTAssertEqual(app.images.count, 2)
        XCTAssertEqual(app.buttons.count, 5)
        XCTAssertEqual(app.staticTexts.count, 2)
        XCTAssertTrue(app.staticTexts["QUIZ"].exists)
    }
    
    func testHowToPlay() {
        let app = XCUIApplication()
        app.buttons.element(matching:.any,identifier:"home_howButton").tap()
        XCTAssertEqual(app.images.count, 1)
        XCTAssertEqual(app.buttons.count, 1)
        XCTAssertEqual(app.staticTexts.count, 1)
        XCTAssertTrue(app.staticTexts["HOW TO PLAY"].exists)
    }
    
}
