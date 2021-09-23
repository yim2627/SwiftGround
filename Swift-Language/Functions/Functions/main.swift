//
//  main.swift
//  Functions
//
//  Created by 임지성 on 2021/09/23.
//

import Foundation

//정의
func greet(person: String) -> String {
 let greeting = "Hello, " + person + "!"
 return greeting
}
//호출
print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"

//문자열 직접 반환 가능
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// Prints "Hello again, Anna!"

//파라미터가 없는 함수
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"

//여러 파라미터를 사용하는 함수
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"

//반환값이 없는 함수
//func greet(person: String) {
//    print("Hello, \(person)!")
//}
//greet(person: "Dave")
// Prints "Hello, Dave!"

//여러 값을 반환하는 함수 - 튜플 반환
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax) // tuple
//}

//반환값의 인자를 접근자로 사용 가능 = bounds.min
//let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"

//Optional Tuple Return Type
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// Optional Chaining으로 실제 반환값 접근
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"

//내외부 인자
func greet(person: String, from hometown: String) -> String { // from - 외부, hometown - 내부
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

//인자 생략
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 함수 안에서 firstParameterName, secondParameterName 인자로 입력받은 첫번째, 두번째 값을 참조
}
someFunction(1, secondParameterName: 2)

//Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 함수 호출시 두번째 인자를 생략하면 함수안에서 parameterWithDefault값은 12가 기본 값으로 사용.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault는 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault는 12

// inout 파라미터 - 인자 값을 직접 변경하는 파라미터, C의 포인터를 생각하면 편함 (*)
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
