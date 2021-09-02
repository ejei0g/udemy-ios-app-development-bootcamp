import Foundation

protocol AdvancedLifeSupport {
    func perfomeCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func chk() {
        print("iamcalling...")
    }
    func medicalEmergency() {
        if let bleep = delegate {
            bleep.perfomeCPR()
        }
    }
   
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func perfomeCPR() {
        print("Doctor perform")
    }
    func test() {
        print("test")
    }
}
let a = EmergencyCallHandler()
let doctor = Doctor(handler: a)

a.chk()
a.medicalEmergency() //trigger 수행

