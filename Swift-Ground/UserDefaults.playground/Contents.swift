import UIKit


/*
 UserDefaults는 '데이터 저장소'이다.
 SingleTon pattern
 [data, key]로 데이터를 저장하며, 이때 key의 값은 String이다.
 어느 곳이든 데이터를 쉽게 읽고 저장할 수 있게한다.
 UserDefaults는 사용자 기본 설정같은 단일 데이터 값에 적합하다.
 
 대량의 데이터를 저장해야하는 경우, sqlite, realm이 더 적합함.
 
 */

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Jiseong", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenByUser")


let array = [1, 2, 3]
defaults.set(array, forKey: "myArray")

let dictionary = ["Name": "Jiseong"]
defaults.set(dictionary, forKey: "myDictionary")

let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenByUser")
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDictionary = defaults.dictionary(forKey: "myDictionary")
