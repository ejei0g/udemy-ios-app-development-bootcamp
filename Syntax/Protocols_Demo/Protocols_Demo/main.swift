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

class Eagle: Bird {
    override func fly() {
        print("power flying... eagle!!")
    }
}

var aa: Bird = Bird()
aa.fly()
var eagle: Eagle = Eagle()

eagle.isFemale = false
eagle.layEgg()
eagle.fly() 
