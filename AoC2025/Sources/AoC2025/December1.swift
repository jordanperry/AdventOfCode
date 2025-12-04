//
//  File.swift
//  AoC2025
//
//  Created by Jordan Perry on 11/30/25.
//

import Foundation
import Numerics

enum December1 {
    struct Input: Equatable {
        private let rawValue: String

        init(rawValue: String) {
            self.rawValue = rawValue
        }

        var deltaValue: Int {
            if rawValue.hasPrefix("L"),
               let value = rawValue.split(separator: "L").last.flatMap({ Int($0) }) {
                return -1 * value
            } else if rawValue.hasPrefix("R"),
                  let value = rawValue.split(separator: "R").last.flatMap({ Int($0) }) {
                return value
            }

            return 0
        }
    }

    final class Rotator {
        var currentValue: Int = 50
        var zeroCount: Int = 0

        func processInputs(_ inputs: [Input]) {
            for input in inputs {
                processInput(input)
            }
        }

        private func processInput(_ input: Input) {
            let start = currentValue
            let delta = input.deltaValue
            guard
                delta != 0
            else {
                return
            }

            let steps = abs(delta)

            let distanceToZero = if delta > 0 {
                start == 0 ? 100 : (100 - start)
            } else {
                start == 0 ? 100 : start
            }

            if steps >= distanceToZero {
                let (laps, _) = euclideanDivision((steps - distanceToZero), 100)
                zeroCount += 1 + laps
            }

            let (_, remainder) = euclideanDivision((start + delta), 100)
            currentValue = remainder
        }
    }
}
