//
//  ViewController.swift
//  DidSet
//
//  Created by Jaeyoung Lee on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        property = 3
        print(property)
    }

//    var property: Int {
//        get {
//            return property
//        }
//        set(value) {
//           property = value
//        }
//    }

    var _property: Int = 0
    var property: Int {
        get {
            return _property
        }
        set(value){
           _property = value
        }
    }
}

