//
//  Tets_Proj_CITests.swift
//  Tets-Proj-CITests
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import XCTest
import SwiftUI
@testable import Tets_Proj_CI

final class CarouselViewTests: XCTestCase {
    func testExample() {
        let app = TetsProjCIApp()
        let view = CarouselView()
        _ = view.body
        _ = app.body
        XCTAssertEqual(view.test(), 4)
    }
}
