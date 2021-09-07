import Foundation

class Animal {
    var name: String
    
    init(n:String) {
        name = n
    }
}
class Human: Animal {
    func introduceSelf() {
        print("Hello, my name is \(name)")
    }
}
class Dog: Animal {
    func roar() {
        print("Grrrrrwwwwwllll...")
    }
}

var happy = Dog(n: "happy")

happy.roar()

var jely = Human(n: "jae")
jely.introduceSelf()

var jun = Human(n: "junh")

var neighbors = [happy, jely, jun]

for n in neighbors {
    print(n.name)
}

let four = Int()

func findDog(from animals: [Animal]) {
    for animal in animals {
        if animal is Dog {
            print("Find the dog!, \(animal.name)")
            // 우리는 animal이 Dog인걸 확신하지만 컴파일러는 그렇지 않다.
            //animal.roar() //because animal의 데이터 타입은 'Animal'이기 때문에
            //Forced Down cast, Animal -> Dog or Human (super -> sub class)
            let dog = animal as! Dog
            dog.roar()
        }
    }
}

findDog(from: neighbors)

if let dog = neighbors[1] as? Dog {
    dog.roar()
}

//print("\(dog?.name)", dog?.roar())
