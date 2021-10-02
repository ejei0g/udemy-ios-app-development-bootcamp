import UIKit

// singleton
let defaults = UserDefaults.standard
let usrSession = URLSession.shared

class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"
let yourCar = Car()

print(yourCar.colour)

// MARK: - Singleton

class OnlyCar {
    var colour = "Red"
    
    static let singletonCar = OnlyCar()
    private init() {
        
    }
}

let myOnlyCar = OnlyCar.singletonCar

myOnlyCar.colour = "Blue"
let yourOnlyCar = OnlyCar.singletonCar
print(yourOnlyCar.colour)

//let testOne = OnlyCar()
//testOne.colour = "blue"
//
//let testTwo = OnlyCar()
//print(testTwo.colour)
