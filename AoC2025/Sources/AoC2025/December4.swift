//
//  December4.swift
//  AoC2025
//
//  Created by Jordan Perry on 12/4/25.
//

import Foundation

enum December4 {
    static func countOfRollsThatCanBeMoved(
        from input: Input,
        repeating: Bool
    ) -> Int {
        guard
            let grid = Grid(input: input)
        else {
            return 0
        }

        guard
            repeating
        else {
            return grid.removeRolls().1
        }

        var repeatingGrid = grid
        var count = 0
        while true {
            let (newGrid, newCount) = repeatingGrid.removeRolls()
            guard
                newCount > 0
            else {
                break
            }

            repeatingGrid = newGrid
            count += newCount
        }

        return count
    }

    struct Input {
        let lines: [String]
        init(rawValue: String) {
            self.lines = rawValue
                .split(separator: "\n", omittingEmptySubsequences: true)
                .map(String.init)
        }
    }

    struct Grid {
        struct Neighbor {
            let x: Int
            let y: Int
            let value: Character
        }

        let width: Int
        let height: Int
        private let characters: [Character]

        private static let neighbors: [(dx: Int, dy: Int)] = [
            (-1, -1), (0, -1), (1, -1),
            (-1, 0), nil, (1, 0),
            (-1, 1), (0, 1), (1, 1),
        ].compactMap { $0 }

        init?(input: Input) {
            guard
                !input.lines.isEmpty
            else {
                return nil
            }

            let width = input.lines[0].count

            guard
                input.lines.allSatisfy({ $0.count == width })
            else {
                return nil
            }

            self.width = width
            self.height = input.lines.count
            self.characters = input.lines.flatMap { $0 }
        }

        private init(
            width: Int,
            height: Int,
            characters: [Character]
        ) {
            self.width = width
            self.height = height
            self.characters = characters
        }

        private func index(x: Int, y: Int) -> Int {
            y * width + x
        }

        private func position(from index: Int) -> (x: Int, y: Int) {
            let x = index % width
            let y = index / width
            return (x, y)
        }

        func neighborsForCharacterAtPosition(
            atX x: Int,
            y: Int
        ) -> [Neighbor] {
            Self.neighbors.compactMap { dx, dy in
                let neighborX = x + dx
                let neighborY = y + dy
                guard
                    neighborX >= 0,
                    neighborX < width,
                    neighborY >= 0,
                    neighborY < height
                else {
                    return nil
                }

                let character = characters[
                    index(
                        x: neighborX,
                        y: neighborY
                    )
                ]

                return Neighbor(
                    x: neighborX,
                    y: neighborY,
                    value: character
                )
            }
        }
    }
}

private extension December4.Grid {
    @discardableResult func removeRolls() -> (Self, Int) {
        var accessibleRolls = 0
        var newCharacters = [Character]()
        for (index, character) in characters.enumerated() {
            guard
                character.isPaperRoll
            else {
                newCharacters.append(character)
                continue
            }

            let (x, y) = position(from: index)
            let neighbors = neighborsForCharacterAtPosition(atX: x, y: y)
            if neighbors.hasFewerThanFourPaperRolls {
                accessibleRolls += 1
                newCharacters.append("x")
            } else {
                newCharacters.append(character)
            }
        }

        return (
            Self(width: width, height: height, characters: newCharacters),
            accessibleRolls
        )
    }
}

private extension Character {
    var isPaperRoll: Bool {
        self == "@"
    }
}

private extension December4.Grid.Neighbor {
    var isPaperRoll: Bool {
        value.isPaperRoll
    }
}

private extension Array where Element == December4.Grid.Neighbor {
    var hasFewerThanFourPaperRolls: Bool {
        count { $0.isPaperRoll } < 4
    }
}
