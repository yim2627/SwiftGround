//
//  main.swift
//  Basic Operators
//
//  Terminology

//  Operators are unary, binary, or ternary

//Assignment Operator

let b = 10
var a = 5
a = b
print(a)
//a is now equla to 10 (b)

let (x, y) = (1, 2)
print("x = \(x), y = \(y)")
//x is equal to 1, y is equal to 2

/*
if x=y {
    //x=y 구문은 값을 리턴하지않는다.
}
*/

//Arithmetic Operators

print(1 + 2) // 3
print(5 - 3) // 2
print(2 * 3) // 6
print(10.0 / 2.5) // 4.0

//The addition operator is also supported for String concatenation
print("Hello, " + "Swift") // Hello, Swift

//Remainder Operator
print(9 % 4) // 1
print(-9 % 4) // -1

//Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree
print(three, minusThree, plusThree) // 3 -3 3

//Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix
print(alsoMinusSix) // -6

//Compound Assignment Operators
var compoundAddNum = 1
compoundAddNum += 2
print(compoundAddNum) // 3

var compoundMinusNum = 1
compoundMinusNum -= 2
print(compoundMinusNum) // -1

var compoundMultiNum = 1
compoundMultiNum *= 2
print(compoundMultiNum) // 2

var compoundDivNum = 5
compoundDivNum /= 2
print(compoundDivNum) // 2

var compoundReminderNum = 5
compoundReminderNum %= 2
print(compoundReminderNum) // 1

//Comparison Operators
print(1 == 1) // true
print(2 != 1) // true
print(2 > 1) // true
print(1 < 2) // true
print(1 >= 1) // true
print(2 <= 1) // false

//Comparison operators are often used in conditional statements
let name = "Swift"
if name == "Swift" { //true
    print("Hello, \(name)")
} else {
    print("I'm sorry \(name), but i don't recognize you")
}
//can compare two tuples if they have the same type and the same number of values.
print((1, "zebra") < (2, "apple")) // true
print((3, "apple") < (3, "bird")) // ture
print((4, "dog") == (4, "dog")) // true
print(("blue", -1) < ("purple", 1)) // true
//print(("blue", false) < ("purple", true)) //bool can't compare

//Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight) // 90

//nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse) // userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse) // userDefinedColorName isnt nil, so colorNameToUse is set to "green"

let curTime: String? = nil
//let unwrappedTime = curTime ?? "IDK"
print("What time is now?: \(curTime ?? "IDK")")

func name(_id: String) -> String? {
    if _id == "D"{
        return "Dad"
    } else {
        return nil
    }
}
print("HI, \(name(_id: "D") ?? "Mom")") // Dad

//Range Operators

//Closed Range Operator
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//1 times 5 is 5
//2 times 5 is 10
//3 times 5 is 15
//4 times 5 is 20
//5 times 5 is 25

//Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count // 4
for i in 0..<count { //0..<4 = 0,1,2,3
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

//One-Sided Ranges
for name in names[2...] {
    print(name)
}
//Brian
//Jack
for name in names[...2] {
    print(name)
}
//Anna
//Alex
//Brain
for name in names[..<2] { // 0,1
    print(name)
}
//Anna
//Alex
let range = ...5
print(range.contains(7)) // false
print(range.contains(1)) // true

//Logical Operators

//Logical NOT (!a)
//Logical AND (a && b)
//Logical OR (a || b)

//Logical NOT Operator
let allowedEntry = false
if !allowedEntry { //True
    print("ACCESS DENIED")
} //ACCESS DENIED

//Logical OR Operator
let hasDoorKey = false
let knowsOverridePassword = false
if hasDoorKey || knowsOverridePassword { //0 or 0
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}//ACCESS DENIED

//Logical AND Operator
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan { //1 and 0
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}//"ACCESS DENIED"

//Combining Logical Operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword { // 1 and 0 or 0 or 0
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}//"ACCESS DENIED"

//Using Explicit Parentheses (Combining Logical Operators)
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword { //(1 and 0) or 0 or 0
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}//"ACCESS DENIED"
