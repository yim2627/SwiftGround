//
//  main.swift
//  ControlFlow
//
//  Created by 임지성 on 2021/09/03.
//

import Foundation

// The for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
let names = ["Anna", "Alex", "Brain", "Jack"]
for name in names {
    print("Hello, \(name)")
}

//iterate over a dictionary to access its key-value pairs.
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//Use the half-open range operator (..<)
let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark) //0...59
}

//stride(from:to:by:), stride(from:through:by:)
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark) //0,5,10...55
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 0, through: hours, by: hourInterval) {
    print(tickMark) //0,3,6,9,12
}

//while loops

/*while condition {
    statement
}*/

//while example
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game Over!")

/*repeat {
    statment
} while condition*/

repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game Over!")


// Conditional Statements
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// "It's very cold. Consider wearing a scarf."

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// "It's really warm. Don't forget to wear sunscreen."

// The final else clause is optional
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
// the temperature is neither too cold nor too warm to trigger the if or else if conditions, no message is printed.

// Switch

/* switch some value to consider {
case value 1:
    respond to value 1
case value 2,
     value 3:
    respond to value 2 or 3
default:
    otherwise, do something else
} */

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// "The last letter of the alphabet"

/* let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a": // the case has an empty body
case "A":
    print("The letter A")
default:
    print("Not the letter A")
} */
// This will report a compile-time error.


let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A": // combine the two values into a compound case, separating the values with commas.
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"

// Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// "There are dozens of moons orbiting Saturn."

// Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// "(1, 1) is inside the box"

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// "on the x-axis with an x value of 2"

// Where -> Condition Statements
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// "(1, -1) is on the line x == -y"

