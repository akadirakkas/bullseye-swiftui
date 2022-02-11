//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by AbdulKadir Akkaş on 28.01.2022.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game: Game!

    override func setUpWithError() throws {
       game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePossitive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

}
