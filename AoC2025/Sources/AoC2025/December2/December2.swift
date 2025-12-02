//
//  File.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/2/25.
//

import Foundation

enum December2 {
    struct ProductIdRange: Equatable {
        let values: [Int]

        enum Validity: Equatable {
            case valid
            case invalid(sum: Int)
        }
        let validity: Validity

        init?(rawValue: String) {
            let components = rawValue
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .components(separatedBy: "-")
            guard
                components.count >= 2,
                let lowerRange = Int(components[0]),
                let upperRange = Int(components[1])
            else {
                return nil
            }

            var values = [Int]()
            var sillyValues = [Int]()
            for value in lowerRange...upperRange {
                values.append(value)

                if value.isSilly {
                    sillyValues.append(value)
                }
            }

            self.values = values
            if values.isEmpty {
                self.validity = .valid
            } else {
                self.validity = .invalid(sum: sillyValues.reduce(0, +))
            }
        }
    }

    static func sillyValueSum(in ranges: [ProductIdRange]) -> Int {
        var total = 0
        for range in ranges {
            guard
                case .invalid(let sum) = range.validity
            else {
                continue
            }

            total += sum
        }

        return total
    }
}

private extension Int {
    var isSilly: Bool {
        let stringValue = "\(self)"
        return stringValue.isRepeating
    }
}

private extension String {
    var isRepeating: Bool {
        let n = count
        for length in 1 ..< (n / 2) + 1 {
            if n % length == 0 {
                let count = n / length
                let index = index(startIndex, offsetBy: length)
                let substring = String(self[..<index])

                let repeatedString = String(repeating: substring, count: count)

                if repeatedString == self {
                    return true
                }
            }
        }

        return false
    }
}
