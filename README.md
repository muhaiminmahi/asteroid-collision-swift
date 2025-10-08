Asteroid Collision (Swift Solution)

This repository contains a Swift implementation of the **Asteroid Collision** problem —  
a popular stack-based algorithm question often seen in coding interviews and platforms like LeetCode.

---

##Problem Description

We are given an array `asteroids` of integers representing asteroids in a row.  
The indices represent their relative position in space.

- Each asteroid’s **absolute value** represents its **size**.  
- The **sign** represents its **direction**:
  - Positive → moving **right**
  - Negative → moving **left**

When two asteroids meet:
- The smaller one will **explode**.
- If both are the same size, **both explode**.
- Asteroids moving in the same direction never collide.

---

Example 1
**Input:**  
`[5, 10, -5]`  
**Output:**  
`[5, 10]`  
**Explanation:**  
10 and -5 collide → 10 survives.  
5 and 10 never collide.

---

Example 2
**Input:**  
`[8, -8]`  
**Output:**  
`[]`  
**Explanation:**  
Both explode.

---

Example 3
**Input:**  
`[10, 2, -5]`  
**Output:**  
`[10]`  
**Explanation:**  
2 and -5 collide → -5 survives.  
10 and -5 collide → 10 survives.

---

Swift Code

```swift
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


| Complexity | Description                                            | 
| **Time**   | O(n) — Each asteroid is pushed/popped at most once     |
| **Space**  | O(n) — Stack may store all asteroids in the worst case |
