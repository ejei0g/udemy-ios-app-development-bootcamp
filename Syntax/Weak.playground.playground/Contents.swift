import UIKit

var greeting = "Hello, playground"

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var a: Person? = Person(name: "jaeylee")

weak var b = a

print(b)

a = nil

print(b)
