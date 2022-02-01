//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Muzlive on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Init"
//        DispatchQueue.global().async {
//            print("in globalQueue")
//            sleep(5)
//            print("after 5seconds")
//        }
//        print("after global Queue")
//        DispatchQueue.main.sync {
//            print("1st task")
//            sleep(3)
//            print("1st task finished")
//        }
//        DispatchQueue.main.sync {
//            print("2st task")
//            sleep(3)
//            print("2st task finished")
//        }
//        DispatchQueue.main.sync {
//            print("3st task")
//            sleep(3)
//            print("3st task finished")
//        }
//        print("asynctask")
       
//        textLabel.text = "Init"
//        DispatchQueue.global().async {
//            print("before textLabel update" )
//            sleep(3)
//
//            DispatchQueue.main.sync {
//                self.textLabel.text = "Test1"
//                print("update textlabel", self.textLabel.text)
//            }
//            print("after textLabel update Test1")
//            sleep(3)
//
//            DispatchQueue.main.sync {
//                self.textLabel.text = "Test2"
//                print("update textlabel", self.textLabel.text)
//            }
//            print("after textLabel update Test2" )
//            sleep(3)
//        }
//        textLabel.text = "Init2"
        
        /// DeadLock
        let testQueue = DispatchQueue(label: "defaultIsSerial", attributes: .concurrent)
        
        testQueue.async {
            print("add Task in serailQueueGlobalCustom")
            testQueue.sync {
                print("with sync Task")
            }
            
            print("DeadLock ㅠㅠ")
        }
    }
    
}

