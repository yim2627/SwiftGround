//
//  main.swift
//  Closure
//
//  Created by 임지성 on 2021/09/24.
//

import Foundation

/* 클로저의 일반적인 형태
 { (Parameter) -> (Return type) in
   Logic...
 }
 */

// inline closure
let names = ["A", "B", "C"]
var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

// 타입 명시 생략 가능
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

// 인자 이름 축약
reversedNames = names.sorted(by: { $0 > $1 } )

//후행 클로저 - 인자로 클로저를 넣기 길다면 후행클로저를 사용하여 함수의 뒤에 사용할 수 있다.
reversedNames = names.sorted() { $0 > $1 }

// 만약 함수의 마지막 인자가 클로저이고 후위 클로저를 사용하면 괄호()를 생략할 수 있다.
reversedNames = names.sorted { $0 > $1 }

// 값 캡쳐 - 클로저는 특정 문맥의 상수나 변수의 값을 캡쳐할 수 있다. 다시말해 원본 값이 사라져도 클로져의 body안에서 그 값을 활용할 수 있다.

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
// 함수가 각기 실행 되지만 실제로는 변수 runningTotal과 amount가 캡쳐링 되서 그 변수를 공유하기 때문에 계산이 누적된 결과를 갖는다
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30


let incrementBySeven = makeIncrementer(forIncrement: 7)
// 다른 클로저이기 때문에 고유의 저장소에 runningTotal과 amount를 캡쳐링 해서 사용한다. 그래서 다른 값이 나온더.
print(incrementBySeven()) // 7
print(incrementBySeven()) // 14

// Escaping Closure
//클로저가 함수의 인자로 전달되지만 함수 밖에서 실행되는 것(함수가 반환된(끝난) 후 실행되는 것)을 Escape한다고 하며, 이러한 경우 매개변수의 타입 앞에 @escaping이라는 키워드를 명시해야한다.
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// @escaping 를 사용하는 클로저에서는 self를 명시적으로 언급해야한다.
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()    // 함수 안에서 끝나는 클로저
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // 명시적으로 self를 적어줘야함.
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"

// Auto Closure
/*
 자동클로저는 인자 값이 없으며 특정 표현을 감싸서 다른 함수에 전달 인자로 사용할 수 있는 클로저이다.
 자동클로저는 클로저를 실행하기 전까지 실제 실행이 되지 않는다. 실제 계산이 필요할 때 호출되기 때문에 계산이 복잡한 연산을 하는데에 유용하다.
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) } // 호출되지않았으니 넘어감
print(customersInLine.count) // 값변화 X
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// Auto Closure를 함수의 인자값으로 넣는 예제
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

// @autoclosure 키워드를 이용해서 보다 간결하게 사용할 수 있다.
// 클로저 인자에 @autoclosure를 선언하면 함수가 이미 클로저 인것을 알기 때문에 인자에 중괄호를 넣지 않아도 된다.
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0)) // 더 간결해진 모습 중괄호 {}가 생략됨
// Prints "Now serving Ewa!"

// Auto Closure를 너무 남용하면 코드를 이해하기 어려워 질 수 있다. 상황이 분명한 경우에만 사용하는 것이 좋다.


// 자동클로저 @autoclosure는 이스케이프 @escaping와 같이 사용할 수 있다.
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []        //  클로저를 저장하는 배열을 선언
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
} // 클로저를 인자로 받아 그 클로저를 customerProviders 배열에 추가하는 함수를 선언
collectCustomerProviders(customersInLine.remove(at: 1))    // 클로저를 customerProviders 배열에 추가
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."        // 2개의 클로저가 추가 됨
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")    // 클로저를 실행하면 배열의 0번째 원소를 제거하며 그 값을 출력
}
// "Now serving Barry!"
// "Now serving Daniella!"
