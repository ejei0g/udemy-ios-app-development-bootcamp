import UIKit

protocol infomation {
}

class Person {
    var name: String = "unknown"
    var age: Int = 0
    init() {
        print("birth \(name)")
    }
    deinit {
        print("Death \(name)")
    }
}

struct Const {
    var change: Int
}
var con = Const.init(change: 0)
con.change = 3

var jaeyoung: Person = .init()

/// init-deinit, 호출시점
//print(jaeyoung.name)
//jaeyoung.name = "jaeyoung"
//print(jaeyoung.name)
//var newPerson = Person.init()
//newPerson.name = "new person"
//jaeyoung = newPerson
//newPerson = .init()
//print(jaeyoung.name, newPerson.name)
//newPerson = jaeyoung

/// 연산 프로퍼티는 다른 저장 프로퍼티의 값을 읽고  쓰는 친구
