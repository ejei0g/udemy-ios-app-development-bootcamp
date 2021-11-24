//
//  ViewController.swift
//  Current Device
//
//  Created by Jaeyoung Lee on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("### UIDevice.current ###")
        print("name: ", UIDevice.current.name)
        print("systemName: ", UIDevice.current.systemName)
        print("systemVersion: ", UIDevice.current.systemVersion)
        print("model: ", UIDevice.current.model)
        print("localizedModel: ", UIDevice.current.localizedModel)
        print("userInterfaceIdiom ", UIDevice.current.userInterfaceIdiom)
        print("identifierForVendor: ", UIDevice.current.identifierForVendor as Any)
        
    }

    override var prefersStatusBarHidden: Bool {
        if UIDevice.current.model == "iPhone 6s" {
            return true
        } else {
            return false
        }
    }
}

