import UIKit

var myDouble = 3.141592

let myRoundedDouble = String(format: "%.2f", myDouble)

print(myRoundedDouble)

extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
      //  print("precision = \(precisionNumber)")
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}


let roundedDouble = myDouble.round(to: 1)

print(roundedDouble)

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
 
button.backgroundColor = .red
//button.layer.cornerRadius = 5
//button.clipsToBounds = true

extension UIButton {
    func makeCircle() {
        self.backgroundColor = .blue
        self.clipsToBounds = true
        //self.layer.cornerRadius = 10
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

button.makeCircle()
