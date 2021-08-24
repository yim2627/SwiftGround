//
//  main.swift
//  String and Characters
//
//  Created by 임지성 on 2021/08/24.
//

import Foundation

let someString = "Some string literal value" //A string literal is a sequence of characters surrounded by (")
//print(someString)

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
""" //Use a multiline string literal a sequence of characters surrounded by three double question marks
//print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
//print(singleLineString)
//print(multilineString)

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""//multilineString line break = backslash(\)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""//line feed
//print(lineBreaks)

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

//Init empty string
var emptyString = "" //empty string literal
var anotherEmptyString = String() //initializer syntax

if emptyString.isEmpty {
//    print("Nothing to see here")
} //Nothing to see here

//String Mutability
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
//compile error - a constant string cannot be modified

//Working with characters
//for character in "Dog!🐶" {
//    print(character)
//}
// D
// o
// g
// !
// 🐶

let exclamationMark: Character = "!" //Character Constant

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
//print(catString)
//"Cat!🐱"

//Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
//var welcome = string1 + string2
//"hello there"

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

//welcome.append(exclamationMark)
// welcome now equals "hello there!"

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

//Accessing and Modifying a String
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
//for index in greeting.indices {
//    print("\(greeting[index]) ", terminator: "")
//}
//"G u t e n   T a g ! "

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"

//Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
//"There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
//"6 mansion scenes; 2 cell scenes"
