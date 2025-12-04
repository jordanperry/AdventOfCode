//
//  Test.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/2/25.
//

@testable import AoC2025
import Foundation
import Testing

struct December2Tests {
    @Test func sillyValueSum() async throws {
        let file = "December2Input"
        let path = try #require(Bundle.module.path(forResource: file, ofType: "txt"))
        let text = try String(contentsOfFile: path, encoding: .utf8)
        let productIdRanges = text.split(separator: ",").map {
            December2.ProductIdRange(rawValue: String($0))
        }.compactMap { $0 }

        #expect(December2.sillyValueSum(in: productIdRanges) == 85513235135)
    }

    @Test func example() async throws {
        let productIdRanges = [
            December2.ProductIdRange(rawValue: "95-115")
        ].compactMap { $0 }

        #expect(December2.sillyValueSum(in: productIdRanges) == 210)
    }
}
