//
//  Tets_Proj_CIUITests.swift
//  Tets-Proj-CIUITests
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import XCTest

final class Tets_Proj_CIUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    @MainActor
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
