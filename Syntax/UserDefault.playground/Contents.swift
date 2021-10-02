import UIKit

let defaults = UserDefaults.standard

defaults.set(0.3, forKey: "Volumes")
defaults.set(true, forKey: "MusicOn")
defaults.set("Jaeylee", forKey: "Players")
defaults.set(Date(), forKey: "AppLastOpenedByUser")

let volume = defaults.float(forKey: "Volumes")
let date = defaults.object(forKey: "AppLastOpenedByUser")
// defaults.data != date 데이터 vs 데이트 문자때문에 10분날렸어요
// Any?타입을 꺼내올 때는 Object사용

print(date)

// MARK: - Array
let arr = [1,2,3]

defaults.set(arr, forKey: "MyArr")
let myArr = defaults.array(forKey: "MyArr")
//return type은 옵셔널 어레이
print(myArr)

//MARK: - Dictionary
let dictionary = ["name" : "jaeylee", "age" : 10] as [String : Any]

defaults.set(dictionary, forKey: "MyDictionary")
let d = defaults.dictionary(forKey: "MyDictionary")
print(d)
