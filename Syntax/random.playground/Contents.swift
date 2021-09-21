import UIKit

var greeting = "Hello, playground"

var i = 100
while i > 0 {

    let randomNum = Int.random(in: 1 ... 100)

    switch randomNum {
    case 77:
        print("SSS")
    case 90 ... 100:
        print("s")
    default: break
        
    }
    i -= 1
}
