class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("lay egg")
        } else {
            print("nothing happen")
        }
    }
    
    func fly() {
        print("fly in to the sky")
    }
}

protocol CanFly {
    func fly()
}

extension CanFly {
    func fly() {
        print("hello Extensions Fly method!")
    }
}

class Eagle: Bird {
    override func fly() {
        super.fly()
        print("power flying... eagle!!")
    }
}

var aa: Bird = Bird()
aa.fly()
var eagle: Eagle = Eagle()

eagle.isFemale = false
eagle.layEgg()
eagle.fly() 

class Wizard: CanFly {
    func fly() {
        //super.fly() // fail
        print("harry porter fly in to the sky!!")
    }
}

let harry: Wizard = Wizard()
harry.fly()


