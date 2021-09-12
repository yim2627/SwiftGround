import UIKit

/*
 Singleton은 특정 용도로 객체를 하나만 생성하여, 공용으로 사용하고 싶을 때 사용하는 디자인 유형
 
 한 번의 Instance만 생성하므로 메모리 낭비를 방지할 수 있음
 Singleton Instance는 전역 Instance로 다른 클래스들과 자원 공유가 쉬움
 DBCP(DataBase Connection Pool)처럼 공통된 객체를 여러개 생성해서 사용해야하는 상황에서 많이 사용 (쓰레드풀, 캐시, 대화상자, 사용자 설정, 레지스트리 설정, 로그 기록 객체등)
 
 Singleton Instance가 너무 많은 일을 하거나, 많은 데이터를 공유시킬 경우 다른 클래스의 Instance들 간 결합도가 높아져  "개방=폐쇄" 원칙을 위배함 (객체 지향 설계 원칙 어긋남) - 수정, 테스트 어려움
 */


// Not Singleton
class Pencil {
    var colour = "Black"
}

let PencilA = Pencil() // 인스턴스 생성
PencilA.colour = "White" // 각 인스턴스 프로퍼티에 저장
let PencilB = Pencil() // 인스턴스 생성
print(PencilB.colour) // 각각의 인스턴스가 생성됐기때문에 PencilA.colour가 바껴도 PencilB에는 상관 X

// Singleton
class Car {
    var colour = "Red"
    
    static let singletonCar = Car() // 전역 상수 생성
    private init() { } // Instance 재생성 방지
}

let myCar = Car.singletonCar // 인스턴스 생성
myCar.colour = "Blue" // 인스턴스 프토퍼티에 저장

let yourCar = Car.singletonCar // 인스턴스 생성
print(yourCar.colour)


/*
 Example
 
 let screen = UIScreen.main
 let userDefault = UserDefaults.standard
 let application = UIApplication.shared
 let fileManager = FileManager.default
 let notification = NotificationCenter.default
 
 */
