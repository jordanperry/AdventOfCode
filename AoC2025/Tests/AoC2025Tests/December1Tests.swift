//
//  Test.swift
//  AoC2025
//
//  Created by Jordan Perry on 11/30/25.
//

@testable import AoC2025
import Foundation
import Testing

struct December1Tests {
    @Test func testCountOfZeroWithInput() async throws {
        let file = "December1Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let inputs = text.split(separator: "\n").map {
            December1.Input(rawValue: String($0))
        }
        let rotator = December1.Rotator()

        rotator.processInputs(inputs)

        #expect(rotator.currentValue == 42)
        #expect(rotator.zeroCount == 5937)
        #expect(inputs.count == 4147)
    }

    @Test func testCountOfZeroWithExample() async throws {
        let rotator = December1.Rotator()
        let inputs = [
            December1.Input(rawValue: "L68"),
            December1.Input(rawValue: "L30"),
            December1.Input(rawValue: "R48"),
            December1.Input(rawValue: "L5"),
            December1.Input(rawValue: "R60"),
            December1.Input(rawValue: "L55"),
            December1.Input(rawValue: "L1"),
            December1.Input(rawValue: "L99"),
            December1.Input(rawValue: "R14"),
            December1.Input(rawValue: "L82"),
        ]

        rotator.processInputs(inputs)

        #expect(rotator.currentValue == 32)
        #expect(rotator.zeroCount == 6)
    }

    @Test func testCountOfZeroFoo() async throws {
        let rotator = December1.Rotator()

        rotator.processInputs([December1.Input(rawValue: "L150")])

        #expect(rotator.currentValue == 0)
        #expect(rotator.zeroCount == 2)
    }
}
