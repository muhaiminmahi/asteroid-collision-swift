//
//  AsteroidCollision.swift
//  leetcode
//
//  Created by Mahi on 8/10/25.
//

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()

        for asteroid in asteroids {
            var current = asteroid
            var destroyed = false
            while let last = stack.last, last > 0, current < 0 {
                if abs(last) < abs(current) {
                    stack.removeLast()
                    continue
                } else if abs(last) == abs(current) {
                    stack.removeLast()
                    destroyed = true
                    break
                } else {
                    destroyed = true
                    break
                }
            }

            if !destroyed {
                stack.append(current)
            }
        }

        return stack
    }

}
