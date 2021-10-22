# KVO? (옵셔널 아님ㅋ)

다른 객체의 프로퍼티 변경사항을 객체에 알리기 위한 코코아 프로그래밍 패턴이다.

NSObject를 상속받아야 사용할 수 있기때문에 상속이 되는 Class에서만 사용이 가능하다.

observer와 observed는 일대일 관계, 일대다 관계가 가능하다.

모델과 뷰같은 논리적으로 분리된 관계간에 변경사항을 전달할 때 유용하다.

Objective-C 런타임에 의존하는 방식이다. 그래서 clean swift 코드엔 지양한다.

타입 정의 밖에 observer를 추가하는 것 뺴곤 property observer(willSet, didSet)과 비슷하다.

```swift
class Address: NSObject { 
	var town: String { 
    	willSet { 
           print(newValue) 
        } 
        didSet { 
           print(oldValue) 
        } 
    } 
    init(town: String) { self.town = town } 
}
```
프로퍼티 옵저버(willSet, didSet)는 타입 내부에서 추가하는 반면

```swift
class MyObjectToObserve: NSObject {}
class MyObserver: NSObject {init(object: MyObjectToObserve){}}

let observed = MyObjectToObserve()
var observer = MyObserver(object: observed)
```
KVO는 타입 외부에서 옵저버를 추가해준다.

따로 옵저버를 제거해주지 않아도 된다. 시스템이 알아서 removeObserver 해준다.


## Annotate a Property for Key-Value Observing

```@objc dynamic```을 추가해 KVO를 통해 관찰하려는 프로퍼티를 마킹한다.

```swift	
class MyObjectToObserve: NSObject {
    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0) // 1970
    func updateDate() {
        myDate = myDate.addingTimeInterval(Double(2 << 30)) // Adds about 68 years.
    }
}
```
```myDate``` 변수를 observe하려는 것이다.
```updateDate()``` 메소드는 ```myDate``` 변수를 변화시키는 기능

## Define an Observer

옵저버 클래스의 인스턴스는 하나 이상의 프로퍼티의 변화된 정보를 관리한다.

옵저버를 만들 때, ```observe(_:options:changeHandler:)```와 observe하려는 프로퍼티를 나타내는 keypath를 호출해서 관찰을 시작한다.

```swift
class MyObserver: NSObject {
    @objc var objectToObserve: MyObjectToObserve
    var observation: NSKeyValueObservation?
    
    init(object: MyObjectToObserve) {
        objectToObserve = object
        super.init()
        
        observation = observe(
            \.objectToObserve.myDate,
            options: [.old, .new]
        ) { object, change in
            print("myDate changed from: \(change.oldValue!), updated to: \(change.newValue!)")
        }
    }
  
  	deinit {
      observation.removeAll()
    }
}
```
위 코드에서 keypath인 ```\.objectToObserve.myDate```는 ```MyobjectToObserve```의 ```mydate``` 프로퍼티를 참조한다.

```NSKeyValueObservedChange``` 인스턴스의 ```oldValue```, ```newValue``` 프로퍼티를 사용해 관찰하는 프로퍼티의 변경사항을 볼 수 있다.
 
만약 관찰하는 프로퍼티가 어떻게 변화하는지 볼 필요가 없다면, ```option``` 파라미터를 생략하면된다. 생략할 경우, ```oldValue```, ```newValue``` 프로퍼티의 값은 nil이 된다.

## Associate the Observer with the Property to Observe

```swift
let observed = MyObjectToObserve()
let observer = MyObserver(object: observed)
```
관찰하고싶은 객체(observed)를 옵저버의 이니셜라이저에 넣어 괌찰자-관찰당하는자 의 관계를 만들어준다.

## Respond to a Property Change

```swift
observed.updateDate() // Triggers the observer's change handler.
// Prints "myDate changed from: 1970-01-01 00:00:00 +0000, updated to: 2038-01-19 03:14:08 +0000"
```
KVO를 사용하도록 설정된 객체(observed)는 프로퍼티(keyPath에 등록된)가 변경된 것을 옵저버에게 알린다.

위에서 말했듯이 updateDate 메소드를 사용해 MyObjectToObserve 인스턴스 프로퍼티(myDate)를 변경한다.


https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift

https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html#//apple_ref/doc/uid/10000177i

https://www.hackingwithswift.com/example-code/language/what-is-key-value-observing

