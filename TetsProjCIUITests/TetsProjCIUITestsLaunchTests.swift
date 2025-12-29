//
//  Tets_Proj_CIUITestsLaunchTests.swift
//  Tets-Proj-CIUITests
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import XCTest

final class TetsProjCIUITestsLaunchTests: XCTestCase {
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
