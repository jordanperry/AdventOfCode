//
//  December3Tests.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/3/25.
//

@testable import AoC2025
import Foundation
import Testing

struct December3Tests {
    @Test func part1() async throws {
        let file = "December3Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let banks = text.split(separator: "\n").compactMap {
            December3.BatteryBank(rawValue: String($0))
        }

        #expect(December3.totalVoltage(in: banks, size: 2) == 17142)
    }

    @Test func part2() async throws {
        let file = "December3Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let banks = text.split(separator: "\n").compactMap {
            December3.BatteryBank(rawValue: String($0))
        }

        #expect(December3.totalVoltage(in: banks, size: 12) == 169935154100102)
    }

    @Test func examplePart1() async throws {
        let banks = [
            December3.BatteryBank(rawValue: "987654321111111"),
            December3.BatteryBank(rawValue: "811111111111119"),
            December3.BatteryBank(rawValue: "234234234234278"),
            December3.BatteryBank(rawValue: "818181911112111"),
        ].compactMap { $0 }

        #expect(December3.totalVoltage(in: banks, size: 2) == 357)
    }

    @Test func examplePart2() async throws {
        let banks = [
            December3.BatteryBank(rawValue: "987654321111111"),
            December3.BatteryBank(rawValue: "811111111111119"),
            December3.BatteryBank(rawValue: "234234234234278"),
            December3.BatteryBank(rawValue: "818181911112111"),
        ].compactMap { $0 }

        #expect(December3.totalVoltage(in: banks, size: 12) == 3121910778619)
    }
}
