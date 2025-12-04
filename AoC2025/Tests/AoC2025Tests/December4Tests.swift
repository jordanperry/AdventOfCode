//
//  December4Tests.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/4/25.
//

@testable import AoC2025
import Foundation
import Testing

struct December4Tests {
    @Test func part1Example() async throws {
        let text = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """
        let input = December4.Input(rawValue: text)

        #expect(December4.countOfRollsThatCanBeMoved(from: input, repeating: false) == 13)
    }

    @Test func part1() async throws {
        let file = "December4Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let input = December4.Input(rawValue: text)

        #expect(December4.countOfRollsThatCanBeMoved(from: input, repeating: false) == 1478)
    }

    @Test func part2Example() async throws {
        let text = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """
        let input = December4.Input(rawValue: text)

        #expect(December4.countOfRollsThatCanBeMoved(from: input, repeating: true) == 43)
    }

    @Test func part2() async throws {
        let file = "December4Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let input = December4.Input(rawValue: text)

        #expect(December4.countOfRollsThatCanBeMoved(from: input, repeating: true) == 9120)
    }
}
