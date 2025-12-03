//
//  December3.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/3/25.
//

import Foundation

enum December3 {
    struct BatteryBank {
        private let rawValue: String

        init?(rawValue: String) {
            guard
                !rawValue.isEmpty
            else {
                return nil
            }

            self.rawValue = rawValue
        }

        func voltage(with batteryCount: Int) -> Int {
            rawValue.maxValueFromCharacters(size: batteryCount)
        }
    }

    static func totalVoltage(
        in banks: [BatteryBank],
        size: Int
    ) -> Int {
        banks.reduce(0) { $0 + $1.voltage(with: size) }
    }
}

private extension String {
    func maxValueFromCharacters(size: Int) -> Int {
        let digits = compactMap { Int(String($0)) }
            .removingLowestValues(until: size)

        var value = 0
        var power = size - 1
        for digit in digits {
            value += digit * Int(pow(Double(10), Double(power)))
            power -= 1
        }

        return value
    }
}

private extension Array where Element == Int {
    func removingLowestValues(until size: Int) -> [Int] {
        var toRemove = count - size
        var values = [Int]()

        for digit in self {
            while toRemove > 0, let last = values.last, last < digit {
                values.removeLast()
                toRemove -= 1
            }
            values.append(digit)
        }

        if values.count > size {
            return Array(values.prefix(size))
        }

        return values
    }
}
