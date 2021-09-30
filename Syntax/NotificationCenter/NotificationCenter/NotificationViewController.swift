//
//  NotificationViewController.swift
//  NotificationCenter
//
//  Created by Jaeyoung Lee on 2021/09/29.
//

import UIKit

class NotificationViewController: UIViewController {
    public var userChoice: String?

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(getFigureStatus), name: Notification.Name(rawValue: "figures"), object: nil)
        // [end] guage figure 수신
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
    }
    var num: Float = 0.0
    
    @IBAction func pressedButton(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //label.text = "\(num)"
    }
    func printt() {
        print("hello")
    }
    
    @objc func getFigureStatus(_ noti : NSNotification) {
        print("hello")
        let data = noti.object as? String ?? ""
        print(data)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
