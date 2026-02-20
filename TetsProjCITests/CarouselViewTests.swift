//
//  Tets_Proj_CITests.swift
//  Tets-Proj-CITests
//
//  Created by Luiz Diniz Hammerli on 29/12/25.
//

import XCTest
@testable import Tets_Proj_CI

final class CarouselViewtests: XCTestCase {
    func testExample() {
        _ = TetsProjCIApp()
        let view = CarouselView(items: [])
        _ = view.body
        XCTAssertEqual(view.test(), 4)
    }
}
