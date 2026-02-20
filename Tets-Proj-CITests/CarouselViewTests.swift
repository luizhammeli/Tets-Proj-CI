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
        _ = TetsProjCIApp()
        let view = CarouselView(items: [.init(color: Color.red, title: "test", systemImage: "test")])
        _ = view.body
        XCTAssertEqual(view.test(), 4)
    }
}
