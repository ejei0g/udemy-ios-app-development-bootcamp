//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Jaeyoung Lee on 2021/09/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var plusbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var num = 0 {
        didSet {
            print("hello")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "figures"), object: "hello" )
        }
    }
    
    @IBAction func pressedPlusButton(_ sender: Any) {
        
        num += 1
        label.text = "\(num)"
    }
    @IBAction func pressedBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "noti") as? NotificationViewController else {
            return
        }
        //nextVC.num = Float(num)

            NotificationCenter.default.post(name: Notification.Name(rawValue: "figures"), object: "hello" )
        
        present(nextVC, animated: true, completion: nil)
    }
    
}

